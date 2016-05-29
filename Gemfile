source "https://rubygems.org"

gem "rails", ">= 5.0.0.rc1", "< 5.1"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "jbuilder", "~> 2.0"

group :development, :test do
  gem "rspec-rails"
  gem "capybara"
  gem "pry"
end

group :test do
  gem "shoulda-matchers", "~> 3.1"
end

group :development, :test, :staging do
  gem "fabrication"
  gem "faker"
end

group :development, :ci do
  gem "rubocop", "0.39.0", require: false
  gem "rubocop-rspec", "1.4.1", require: false
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production, :staging do
  gem "rails_12factor"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
