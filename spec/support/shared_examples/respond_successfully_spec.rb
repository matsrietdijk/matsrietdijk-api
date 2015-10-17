RSpec.shared_examples_for 'a successful responder' do |response_body|
  it { is_expected.to respond_with(200) }
  its(:response) { is_expected.to be_success }
  its('response.body') { is_expected.to eq(send(response_body)) }
end
