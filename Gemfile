source 'https://rubygems.org'

git_source(:github) do |repo_name|
	repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
	"https://github.com/#{repo_name}.git"

end
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Bootstrap because I'm lazy and it looks good
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'

# Pundit handles my access permissions for everything
gem "pundit"

# Google oauth2 is by far the easiest way to do this
gem "omniauth-google-oauth2", "~> 0.4.1"

# Handles cron jobs
gem 'whenever', :require => false

# I need refile cause my shit is breaking
gem 'sinatra', github: 'sinatra/sinatra', branch: 'master'
gem 'refile', require: 'refile/rails', github: 'refile/refile'
gem 'refile-mini_magick', github: 'refile/refile-mini_magick'
gem 'refile-s3'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
	# Call 'byebug' anywhere in the code to stop execution and get a debugger console
	gem 'byebug', platform: :mri
  gem 'timecop', '~> 0.8.1'
end

group :development do
	# Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
	gem 'web-console', '>= 3.3.0'
	gem 'listen', '~> 3.0.5'
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
	gem 'spring-watcher-listen', '~> 2.0.0'

  # Model annotation
  gem 'annotate'

  # Guard live reloads our webpages and helps me annotate my schemas
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard-annotate'
end

group :test do
  gem 'rspec-rails',        '~> 3.5', '>= 3.5.2'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'faker',              '~> 1.6', '>= 1.6.6'
  gem 'database_cleaner',   '~> 1.5', '>= 1.5.3'
  gem 'shoulda-matchers',   '~> 3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
