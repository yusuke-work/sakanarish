source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.4', '>= 6.0.4.1'

# Assets
gem 'bootsnap', '>= 1.4.2', require: false
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
# gem "chartkick"
# gem 'chart-js-rails'

# Database
gem 'mysql2', '>= 0.4.4'
# gem 'redis', '~> 4.0'

# Seeds
gem 'seed-fu'

# Application server
gem 'puma', '~> 4.1'

# UI/UX
# gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# Authentication
# gem 'pundit'
gem 'sorcery'

# Configuration
gem 'dotenv-rails'

group :development, :test do
  # CLI
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Code analyze
  gem 'rubocop', require:false
  gem 'rubocop-rails', require:false

  # Debugger
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  
    # エラー画面カスタマイズ
  gem 'better_errors'
  gem 'binding_of_caller'

  # Print debug
  gem 'awesome_print'

  # Test
  gem 'rspec-rails'
  gem 'factory_bot_rails'

  # Table/Schema
    # shema情報書き出し
  gem 'annotate'

  # Http
  gem 'httpclient'
end

group :development do
  # Debugger
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'

end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
