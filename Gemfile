source 'https://rubygems.org'

ruby '2.2.3'

gem 'bundler', '>= 1.10.6'
gem 'rails', github: 'rails/rails'
gem 'sprockets-rails', github: 'rails/sprockets-rails'
gem 'sprockets', github: 'rails/sprockets'
gem 'sass-rails', github: 'rails/sass-rails'
gem 'arel', github: 'rails/arel'
gem 'rack', github: 'rack/rack'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18.3'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.10'

gem 'puma', '~> 2.14.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use ActiveModelSerializers to serialize JSON responses
gem 'active_model_serializers', '~> 0.10.0.rc3'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
gem 'aasm', '~> 4.4.0'
gem 'kaminari', '~> 0.16.3'
gem 'airbrake', '~> 4.3.3'
gem 'sidekiq', '~> 3.5.1'

group :development, :test do
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker', '~> 1.5.0'
  gem 'rubocop', '~> 0.34.2', require: false
  gem 'rubocop-rspec', '~> 1.3.1'
  gem 'brakeman', '~> 3.1.1', require: false
end

group :development do
  gem 'spring'
  gem 'pry-byebug', '~> 3.2.0'
end

group :test do
  gem 'simplecov', '~> 0.10.0', require: false
  gem 'codeclimate-test-reporter', '~> 0.4.8', require: false
  gem 'rspec-rails', '~> 3.1.0'
  gem 'rspec-sidekiq', '~> 2.1.0'
  gem 'rspec-its', '~> 1.2.0'
  gem 'shoulda-matchers', '~> 3.0.0'
  gem 'rails-controller-testing', '~> 0.0.3'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
