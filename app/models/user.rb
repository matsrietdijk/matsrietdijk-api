class User < ActiveRecord::Base
  has_secure_password

  before_create :generate_api_token

  validates :username, presence: true, uniqueness: true
  validates :api_token, allow_nil: true, uniqueness: true

  private

  def generate_api_token
    loop do
      self.api_token = SecureRandom.hex
      break unless self.class.exists?(api_token: api_token)
    end
  end
end
