class User < ActiveRecord::Base
  has_one :pocket_account
end
