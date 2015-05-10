source "https://rubygems.org"

gem "rails", "4.2.1"
gem "sqlite3"
gem "jbuilder", "~> 2.0"
gem "rack-cors"
gem "rails_admin"

group :production do
  gem "therubyracer"
end

group :development, :test do
  gem "web-console", "~> 2.0"
  gem "spring"
  gem "quiet_assets"

  gem "capistrano-rails"
  gem "capistrano-bundler", require: false
  gem "capistrano-rbenv", require: false
  gem "capistrano-passenger", "0.0.1", require: false
end

group :test do
  gem "minitest-reporters"
  gem "shoulda"
  gem "factory_girl_rails"
end
