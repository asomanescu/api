source "https://rubygems.org"

ruby "2.3.0"

gem 'rails', '>= 5.0.0.beta4', '< 5.1'

gem "autoprefixer-rails"
gem "bourbon", "5.0.0.beta.5"
gem "delayed_job_active_record"
gem "flutie"
gem "high_voltage"
gem "honeybadger"
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "puma"
gem "rack-canonical-host"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "sprockets", ">= 3.0.0"
gem "sprockets-es6"
gem "title"
gem "uglifier"
gem 'pg', '~> 0.18'
gem 'active_model_serializers', '0.10.0.rc2'
gem 'kaminari'

group :development do
  gem "quiet_assets"
  gem "refills"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem 'annotate'
  gem 'better_errors'
  gem "binding_of_caller"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rails_stdout_logging"
  gem "rack-timeout"
end
