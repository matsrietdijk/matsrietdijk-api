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

  it { is_expected.to allow_value('a', '0', 'a0', 'a_z').for(:username) }
  it { is_expected.to_not allow_value('A0', 'a-z', '#', '&', '_a', 'a_').for(:username) }
  it { is_expected.to allow_value(nil).for(:api_token) }
  it { is_expected.to validate_length_of(:api_token).is_equal_to(User::API_TOKEN_LENGTH) }

  context '.' do
    describe 'create' do
      subject { create(:user, api_token: nil) }

      its(:api_token) { is_expected.to be_present }
    end
  end
end
