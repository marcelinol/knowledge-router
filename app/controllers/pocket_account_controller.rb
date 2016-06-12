class PocketAccountController < ApplicationController
  def new
  end

  def connect
    request_token = get_request_token
    redirect_uri = 'http://goo.gl/C9Ly2F' ## http://localhost:3000/pocket-callback shortened
    if current_user.pocket_account.present?
      current_user.pocket_account.code = request_token
    else
      current_user.pocket_account = PocketAccount.create(user: current_user, code: request_token)
    end

    redirect_to "https://getpocket.com/auth/authorize?request_token=#{request_token}&redirect_uri=#{redirect_uri}"
  end

  def callback
    pocket_authorization_url = 'https://getpocket.com/v3/oauth/authorize'
    request_token = current_user.pocket_account.code

    response = RestClient.post pocket_authorization_url, { consumer_key: '55347-09b806c0cb427299f30cb84d', code: request_token }

    current_user.pocket_account.access_token = response.match(/access_token=(.*)&/)[1]
  end

  def create
    @pocket_account = PocketAccount.new(pocket_account_params)

    respond_to do |format|
      if @pocket_account.save
        format.html { redirect_to @pocket_account, notice: 'PocketAccount was successfully created.' }
        format.json { render :show, status: :created, location: @pocket_account }
      else
        format.html { render :new }
        format.json { render json: @pocket_account.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def get_request_token
    response = RestClient.post 'https://getpocket.com/v3/oauth/request', { consumer_key: '55347-09b806c0cb427299f30cb84d', redirect_uri: 'http://pudim.com.br' }

    # reponse format: "code=3c607e76-5786-4c3c-47ee-cc15ae"
    response.match(/code=(.*)/)[1]
  end

end
