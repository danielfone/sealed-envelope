source 'https://rubygems.org'

ruby File.read('.ruby-version').strip

gem 'rails', '4.2.4'
gem 'pg'
gem 'responders'
gem 'bcrypt'
gem 'puma'
gem 'rails_12factor', group: :production

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'bootstrap_form'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'factory_girl_rails'
end

group :test do
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'capybara'
  gem 'capybara-email'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

