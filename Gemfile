source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'mysql2'
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'fuubar' # rspec formatter
  gem 'database_cleaner'
end

group :development do
  # Guard
  gem 'guard-rspec'
end

group :test do
  gem 'shoulda-matchers'
  gem 'zeus'
end