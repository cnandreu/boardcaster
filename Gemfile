source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'thin'
gem 'heroku'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'turn', :require => false
  gem 'sqlite3'
end
