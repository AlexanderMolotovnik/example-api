source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'bcrypt', '~> 3.1.7'
gem 'mini_magick', '~> 4.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'
gem 'active_model_serializers', '~> 0.10.0'
gem 'grape', '>= 0.10.0'
gem 'will_paginate'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-nav'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
