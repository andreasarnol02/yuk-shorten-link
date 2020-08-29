source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

# Drivers
gem 'pg', '>= 0.18', '< 2.0'
gem 'redis', '~> 4.0'
gem 'image_processing', '~> 1.2' # Use Active Storage variant

# Use Puma as the app server
gem 'puma', '~> 4.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Jobs
gem 'sidekiq'
gem 'sinatra', github: 'sinatra/sinatra'

# Authentication
gem 'devise'
gem 'devise-jwt'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # ENV for development
  gem 'dotenv-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Generating fake data
  gem 'faker', require: false

  # Code critics
  gem 'rubocop', '~> 0.89.1', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'brakeman', '>= 4.0', require: false
  gem 'benchmark-ips', require: false
end

group :test do
  # Unit Testing Tools 
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'

  # Database cleaner for cleaning database each time new test begin
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

