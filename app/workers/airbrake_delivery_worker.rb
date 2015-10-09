class AirbrakeDeliveryWorker
  include Sidekiq::Worker
  include Airbrake

  sidekiq_options retry: 5

  def perform(notice)
    Airbrake.sender.send_to_airbrake(notice)
  end
end
