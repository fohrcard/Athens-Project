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

group :development, :test do
  gem 'curb'
  gem 'pry-rails'
end

group :development do
  gem 'spring'
end

group :production do
  gem 'rack-timeout'
  gem 'rails_12factor'
end
