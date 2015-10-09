require 'rails_helper'

RSpec.describe AirbrakeDeliveryWorker, type: :worker do
  it { is_expected.to be_processed_in :default }
  it { is_expected.to be_retryable 5 }

  it 'passes notice to airbrake' do
    notice = Faker::Lorem.sentence
    allow(Airbrake.sender).to receive(:send_to_airbrake)
    subject.perform(notice)
    expect(Airbrake.sender).to have_received(:send_to_airbrake).with(notice)
  end
end
