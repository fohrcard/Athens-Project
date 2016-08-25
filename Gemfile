source 'https://rubygems.org'
ruby "2.3.0"

gem 'aws-sdk', '>= 2.0.0'
gem 'delayed_job_active_record'
gem 'jwt', '~> 1.5', '>= 1.5.2'
gem 'puma', '~> 3.4'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg', '~> 0.18.4'
gem 'rack-cors', '~> 0.4.0', :require => 'rack/cors'
gem 'kaminari', '~> 0.17.0'

group :development, :test do
  gem 'curb'
  gem 'dotenv-rails', github: "bkeepers/dotenv"
  gem "pry-rails"
end

group :development do
  gem 'spring'
end

group :production do
  gem "rack-timeout"
  gem "rails_12factor"
end
