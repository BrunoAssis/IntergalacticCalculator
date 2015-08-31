require "bundler/setup"
require "IntergalacticCalculator"

filename = ARGV[0]
calculator = IntergalacticCalculator::Calculator.new
calculator.calculate! filename
