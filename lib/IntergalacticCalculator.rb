require "IntergalacticCalculator/version"
require "IntergalacticCalculator/parser"
require "IntergalacticCalculator/commands/command"
require "IntergalacticCalculator/commands/definition_command"
require "IntergalacticCalculator/commands/currency_command"
require "IntergalacticCalculator/commands/query_definition_command"
require "IntergalacticCalculator/commands/query_currency_command"
require "IntergalacticCalculator/commands/invalid_command"

module IntergalacticCalculator
  class Calculator
    attr_reader :filename

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
        eval command.evaluate
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
