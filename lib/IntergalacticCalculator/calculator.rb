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
        puts not_passed_file_message
      else
        unless File.file? @filename
          puts not_valid_file_message
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
          new_alien_numeral = command.execute
          @alien_numerals.merge! new_alien_numeral
        elsif command.is_a? SetCurrencyCommand
          new_currency = command.execute(build_alien_converter)
          @currencies.merge! new_currency
        elsif command.is_a? QueryAlienQuantityCommand
          puts command.execute(build_alien_converter)
        elsif command.is_a? QueryCurrencyCommand
          puts command.execute(build_alien_converter, @currencies)
        elsif command.is_a? InvalidCommand
          puts command.execute
        end
      end
    end

    def build_alien_converter
      AlienConverter.new @alien_numerals
    end

    def not_passed_file_message
      %q{Please, specify a file:
intergalactic_calculator [input_file]
Usage example:
intergalactic_calculator example_input.txt}
    end

    def not_valid_file_message
      "The selected filename #{@filename} is not a valid file."
    end
  end
end
