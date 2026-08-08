source "https://rubygems.org"

gem "rails", "~> 8.1.0"

gem "sprockets-rails"
gem "jsbundling-rails", ">= 1.3.0"
gem "terser"

gem "pg"

gem "diff-lcs", require: [ "diff-lcs", "diff/lcs/array" ]
gem "dalli"
gem "connection_pool"
gem "exception_notification"
gem "will_paginate"
gem "will-paginate-i18n"
gem "sitemap_generator"
gem "daemons", require: false
gem "newrelic_rpm"
gem "nokogiri"
gem "rails-i18n"
gem "addressable", require: "addressable/uri"
gem "mini_magick"
gem "ruby-vips"
gem "i18n-js", "~> 3.0.0"
gem "mini_mime"
gem "puma", require: false

gem "streamio-ffmpeg"
gem "file_signature", git: "https://github.com/distler/file_signature.git"

group :test, :development do
  gem "rspec"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "database_cleaner"
end

group :standalone do
  gem "unicorn", require: false
  gem "unicorn-worker-killer", require: false
end

group :test do
  gem "rails-controller-testing"
end

gem "pry", group: [ :development, :test ]
gem "rubocop-rails-omakase", require: false, group: [ :development ]

gem "oj", platforms: :mri
gem "multi_json"
gem "jbuilder", "~> 2.5"

# Must be last.
gem "rack-mini-profiler", group: :development
