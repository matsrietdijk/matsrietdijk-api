class User < ActiveRecord::Base
  API_TOKEN_LENGTH = 32

  has_secure_password

  before_create :generate_api_token

  validates :username, presence: true, uniqueness: true
  validates :api_token, allow_nil: true, uniqueness: true, length: { is: API_TOKEN_LENGTH }

  private

  def generate_api_token
    loop do
      self.api_token = SecureRandom.hex(API_TOKEN_LENGTH)
      break unless self.class.exists?(api_token: api_token)
    end
  end
end
