#!/usr/bin/env ruby

require "bundler/setup"
require "IntergalacticCalculator"

begin
  filename = ARGV[0]
  calculator = IntergalacticCalculator::Calculator.new
  calculator.calculate! filename
rescue LoadError => e
  require 'rubygems'
  path = File.expand_path '../../lib', __FILE__
  $:.unshift(path) if File.directory?(path) && !$:.include?(path)
  require "IntergalacticCalculator/runner.rb"
end
