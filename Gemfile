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
# gem 'bcrypt', '~> 3.1.7'

gem 'puma', '~> 2.14.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use ActiveModelSerializers to serialize JSON responses
gem 'active_model_serializers', '~> 0.10.0.rc2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'rubocop', '~> 0.34.2', require: false
  gem 'rspec-rails', '~> 3.1.0'
  gem 'byebug'
end

group :development do
  gem 'spring'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 0.4.8', require: nil
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
