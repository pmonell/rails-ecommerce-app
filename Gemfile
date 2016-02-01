source 'https://rubygems.org'


gem 'rails', '4.2.2'
gem 'rails-api'
gem 'pg'

# api gem
gem 'active_model_serializers'

gem 'devise'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'sqlite3'
  gem 'spring'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

# for respond_to syntax moved to gem since rails > 4.2
gem 'responders'
