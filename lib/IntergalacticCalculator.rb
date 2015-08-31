require "IntergalacticCalculator/version"
require "IntergalacticCalculator/parser"
require "IntergalacticCalculator/roman_numeral"
require "IntergalacticCalculator/alien_converter"
require "IntergalacticCalculator/commands/command"
require "IntergalacticCalculator/commands/set_alien_numeral_command"
require "IntergalacticCalculator/commands/set_currency_command"
require "IntergalacticCalculator/commands/query_alien_quantity_command"
require "IntergalacticCalculator/commands/query_currency_command"
require "IntergalacticCalculator/commands/invalid_command"

module IntergalacticCalculator
  class Calculator
    def initialize
      @alien_numerals = {}
      @currencies = {}
    end

    def calculate!(filename)
      @filename = filename
      evaluate_file
    end

    private
    def evaluate_file
      unless @filename
        puts not_passed_file
      else
        unless File.file? @filename
          puts not_valid_file
        else
          parse_file
        end
      end
    end

    def parse_file
      parser = Parser.new
      File.foreach(@filename) do |line|
        command = parser.parse line
        if command.is_a? SetAlienNumeralCommand
          alien_numeral = command.execute
          @alien_numerals.merge! alien_numeral
        else
          alien_converter = AlienConverter.new @alien_numerals
          if command.is_a? SetCurrencyCommand
            currency = command.execute alien_converter
            @currencies.merge! currency
          else
            if command.is_a? QueryAlienQuantityCommand
              response = command.execute alien_converter
            elsif command.is_a? QueryCurrencyCommand
              response = command.execute alien_converter, @currencies
            elsif command.is_a? InvalidCommand
              response = command.execute
            end
            puts response
          end
        end
      end
    end

    def not_passed_file
      %q{Please, specify a file:
intergalactic_calculator [input_file]
Usage example:
intergalactic_calculator example_input.txt}
    end

    def not_valid_file
      "The selected filename #{@filename} is not a valid file."
    end
  end
end
