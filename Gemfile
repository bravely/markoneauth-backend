source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'pg'
gem 'active_model_serializers', '~> 0.8.3'
gem 'dotenv-rails'
gem 'devise'

group :development, :test do
  gem 'pry-rails'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rubocop'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'mailcatcher'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webrat'
  gem 'should_not'
  gem 'bundler-audit'
end

group :ct do
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
  gem 'guard-brakeman'
end
