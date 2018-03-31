source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Upload images to Amazon S3
gem 'aws-sdk'
# Required for validations
gem 'fastimage'
# Required for image versioning
gem 'image_processing'
# Required for image versioning
gem 'mini_magick'
# Shrine :)
gem 'shrine'

gem 'spectre_form_with', github: 'codyeatworld/spectre_form_with'

gem 'jsonapi-rails'

# ENV variables/secrets
gem 'figaro'

gem 'acts_as_list'

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'mina'
gem 'sidekiq'
gem 'highline',  require: false
gem 'mina-puma', require: false
gem 'mina-scp',  require: false
gem 'rack-cors', :require => 'rack/cors'
