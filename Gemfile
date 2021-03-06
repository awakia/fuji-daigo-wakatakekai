ruby "2.5.3"
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.8'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'thin'

gem 'simple_enum', '~> 1.6.9'
gem 'mini_magick'
gem 'carrierwave'
gem 'fog'
gem 'kaminari'
gem 'kaminari-i18n'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

gem 'pg', '~> 0.19.0'
group :production do
  gem 'rails_12factor'  # for heroku
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'pry-rails'
  gem 'pry-doc', '0.6.0'
  gem 'pry-stack_explorer'

  if RUBY_VERSION >= '2.0.0'
    gem 'pry-byebug'
  else
    gem 'pry-debugger'
    gem 'pry-remote'
  end

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'hirb'
  gem 'hirb-unicode'

  gem 'tapp'
  gem 'awesome_print'
  gem 'quiet_assets'
  gem 'annotate'
  gem 'dotenv-rails'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
