# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'liker/version'
 
Gem::Specification.new do |s|
  s.name        = "liker"
  s.version     = Liker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jonathan Julian"]
  s.email       = ["jonathan.m.julian@gmail.com"]
  s.homepage    = "http://github.com/410labs/liker"
  s.summary     = "Insert Facebook Like buttons and Open Graph tags on your pages"
  s.description = "Liker is an easy way to insert Facebook Like buttons and Open Graph tags into your Rails views."
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.files        = Dir.glob("{lib}/**/*") + %w(LICENSE.txt README.md)
  s.require_path = 'lib'
end