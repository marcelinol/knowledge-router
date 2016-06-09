require 'rails_helper'

RSpec.describe PocketAccountController, type: :controller do

  describe "GET #connect" do
    it "returns http success" do
      get :connect
      expect(response).to have_http_status(:success)
    end
  end

end
