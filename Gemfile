source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jsonapi-serializers', '~> 1.0.1'
gem 'jwt', '~> 2.1.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit', '~> 2.0.1'
gem 'rails', '~> 5.0.7', '>= 5.0.7.1'
gem 'whenever', '~> 0.11.0', require: false
gem 'will_paginate', '~> 3.1.7'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails', '~> 4.9.0'
  gem 'rspec-rails', '~> 3.8.2'

end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '~> 0.67.2', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
