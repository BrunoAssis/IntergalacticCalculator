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
        options = {alien_numerals: @alien_numerals,
                   currencies: @currencies,
                   alien_converter: build_alien_converter}
        response = command.execute options
        if response.is_a? String
          puts response
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
