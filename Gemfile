source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.13'

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'devise'
gem 'figaro'
gem 'simple_form'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'quiet_assets'
  gem 'sqlite3'
end

group :development, :test do
  gem 'factory_girl_rails'
end
