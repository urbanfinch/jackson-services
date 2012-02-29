require 'rubygems'
require 'bundler'

Bundler.require

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| require(f) }

ENV['RACK_ENV'] ||= 'development'