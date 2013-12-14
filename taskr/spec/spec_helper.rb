$:.unshift(File.absolute_path(File.dirname(__FILE__)+"../lib"))
require 'bundler'
Bundler.require
require 'taskr'
