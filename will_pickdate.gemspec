# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "will_pickdate/version"

Gem::Specification.new do |s|
  s.name        = "will_pickdate"
  s.version     = WillPickdate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fabio Batista"]
  s.email       = ["fbatista@webreakstuff.com"]
  s.homepage    = "http://github.com/fbatista/ruby_will_pickdate"
  s.summary     = "Gem wrapping of will_pickdate javascript widget"
  s.description = "Ruby gem wrapping will_pickdate javascript widget giving support for rails datetime_select to render it instead of the usuall set of select boxes."

  s.rubyforge_project = "will_pickdate"

  s.add_development_dependency "rake"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "activesupport"
  s.add_development_dependency "actionpack"
  s.add_development_dependency 'jquery-rails'

  s.files         = Dir["{lib,test}/**/*", "[A-Z]*", "init.rb"] - ["Gemfile.lock"]
  s.test_files    = Dir["test/**/*"]
  s.require_paths = ["lib"]
end