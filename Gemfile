source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").strip

gem "bootsnap", require: false
gem "dartsass-rails"
gem "devise"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem 'sassc-rails'
gem "simple_form"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
  gem "factory_bot_rails", "~> 6.2"
  gem "faker"
end

group :development do
  gem "annotate"
  gem "rails_live_reload"
  gem "letter_opener"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 6.0.0"
  gem "shoulda-matchers"
  gem "webdrivers"
end
