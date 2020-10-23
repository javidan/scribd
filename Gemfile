# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "grape"
gem "sequel"
gem "sqlite3"
gem "rake"
gem "grape-swagger"
gem "rack-cors"
gem "rspec"
gem "activesupport"


group :test do
  gem 'simplecov', require: false
  gem 'database_cleaner-sequel'
end

group :development do
  gem 'pry-byebug'
end