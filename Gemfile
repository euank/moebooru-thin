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
gem "image_size"
gem "i18n-js", ">= 3.0.0.rc7"

gem "streamio-ffmpeg"
# The git 1.2.x contains webm; this is what we want
gem "file_signature", :git => 'http://github.com/distler/file_signature.git'

group :standalone do
  platform :mri do
    gem "unicorn", :require => false
    gem "unicorn-worker-killer", :require => false
  end
  gem "puma", :platforms => [:jruby, :rbx, :mswin], :require => false
end

group :test do
  gem "rails-controller-testing"
end

gem "pry", group: [ :development, :test ]
gem "rubocop-rails-omakase", require: false, group: [ :development ]

gem "jbuilder", "~> 2.5"

# Must be last.
gem "rack-mini-profiler", group: :development
