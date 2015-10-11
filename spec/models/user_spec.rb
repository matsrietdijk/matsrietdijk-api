require 'rails_helper'

RSpec.describe User, type: :model do
  PRESENCE = %w(password username).freeze
  UNIQUE = %w(username api_token).freeze

  it { is_expected.to have_secure_password }

  PRESENCE.each do |field|
    it { is_expected.to validate_presence_of(field) }
  end

  UNIQUE.each do |field|
    it { is_expected.to validate_uniqueness_of(field) }
  end

  it { is_expected.to allow_value(nil).for(:api_token) }
end
