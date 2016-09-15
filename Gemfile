source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '>= 5.0.0.1', '< 5.1'
gem 'aws-sdk'
gem 'delayed_job_active_record'
gem 'jwt'
gem 'puma'
gem 'pg'
gem 'rack-cors', :require => 'rack/cors'
gem 'kaminari'
gem 'figaro'
gem 'bcrypt'
gem 'faker'

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem "fakeredis", :require => "fakeredis/rspec"
end
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'spring-commands-rspec'
  gem 'spring'
  gem 'factory_girl_rails'
  gem 'curb'
  gem 'pry-rails'
end
group :development do
end
group :production do
  gem 'rack-timeout'
  gem 'rails_12factor'
end
