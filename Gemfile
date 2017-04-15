source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',                    '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg',                       '~> 0.18'
gem 'puma',                     '~> 3.0'
gem 'sass-rails',               '~> 5.0'
gem 'uglifier',                 '>= 1.3.0'
gem 'coffee-rails',             '~> 4.2'
gem 'therubyracer',             platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks',               '~> 5'
gem 'jbuilder',                 '~> 2.5'

group :development do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug',                 platform: :mri
  gem 'better_errors'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  gem 'listen',                 '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
end

group :test do
  gem 'rspec-rails',            '~> 3.5'
  gem 'capybara',               '~> 2.13'
  gem 'poltergeist',            '~> 1.10'
  gem 'capybara-webkit',        '~> 1.11', '>= 1.11.1'
  gem 'timecop',                '~> 0.8.1'
  gem 'rubocop',                '~> 0.42.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
