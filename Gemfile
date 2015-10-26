source 'https://rubygems.org'
ruby '2.2.2'

gem 'puma'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Bootstrap SASS for UI
gem 'bootstrap-sass', '~> 3.3.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Simple form as form template
gem 'simple_form'
# Slim rails as slim template
gem "slim-rails"
# Devise for authentication
gem "devise"
# Rolify for authorization
gem "rolify"
# nprogress rails
gem "nprogress-rails"
# Font Awesome Rails
gem 'font-awesome-rails'
# Breadcrumb
gem 'breadcrumbs_on_rails'
# FRiendly ID
gem 'friendly_id'
# Kaminari
gem 'kaminari'
# Meta SEO
gem 'meta-tags'
# Omniauth
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
# Active record session
gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
# Setting config and credentials
gem "config"
# Ahoy
gem 'ahoy_matey'
# Charting
gem "chartkick"
# Grouping date
gem 'groupdate'
# Carrierwave
gem 'carrierwave'
gem 'mini_magick'
# Active job backport
# gem 'activejob_backport'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'
  #Rspec for testing
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'shoulda-callback-matchers'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Disable asset log
  gem 'quiet_assets'
  #Letter opener for email
  gem "letter_opener"
  # Some useful gems for optimization
  gem 'bullet'
  gem 'lol_dba' # run: rake db:find_indexes
  gem 'pry-rails'
  gem 'rack-mini-profiler'
  gem 'rails_best_practices' # run: rails_best_practices -f html .
end

group :production do
  gem 'rails_12factor'
  gem 'exception_notification'
end
