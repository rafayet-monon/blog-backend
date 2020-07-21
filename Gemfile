source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'annotate'
  gem 'brakeman', require: false # A static analysis security vulnerability scanner for Ruby on Rails applications
  gem 'bullet' # help to kill N+1 queries and unused eager loading
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner' # Use Database Cleaner
  gem 'factory_bot_rails'
  gem 'rspec-rails', '>=4.0.0.beta2' # Rails testing engine
  gem 'shoulda-matchers' # Tests common Rails functionalities
  gem 'simplecov', require: false # code coverage analysis tool for Ruby
  gem 'vcr' # Gem for recording test suite's HTTP interactions
  gem 'webmock' # Library for stubbing and setting expectations on HTTP requests in Ruby
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'fast_jsonapi'
gem 'rack-cors', require: 'rack/cors'
gem 'service-nakama'

gem 'devise'
gem 'jwt'
gem 'fast_jsonapi'