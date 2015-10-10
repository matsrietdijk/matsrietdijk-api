class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :api_token, allow_nil: true, uniqueness: true
end
