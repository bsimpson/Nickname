# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nickname/version"

Gem::Specification.new do |s|
  s.name = 'nickname'
  s.version = Nicknames::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'Ben Simpson'
  s.email = 'thehoagie@gmail.com'
  s.homepage = 'http://mrfrosti.com'
  s.description = 'Generate a populated ActiveRecord model of nicknames'
  s.summary = 'Generate a populated ActiveRecord model of nicknames'
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency 'activerecord', '>=3'
end
