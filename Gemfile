source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'ransack'
gem 'rails', '~> 5.1.4'
#gem 'sqlite3' 
gem 'pg', '~> 0.21' 
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'pundit'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'jquery-rails'
gem 'devise'
gem 'slim'

group :development do
  #gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
end

group :development do
  gem "capistrano", "~> 3.10", require: false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
