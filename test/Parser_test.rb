require 'test_helper'
module IntergalacticCalculator
  class ParserTest < Minitest::Test
    def setup
      @parser = Parser.new
    end

    def test_parse_definition
      command = @parser.parse "glob is I"
      assert command.is_a? SetAlienNumeralCommand
    end

    def test_parse_currency
      command = @parser.parse "glob glob Silver is 34 Credits"
      assert command.is_a? SetCurrencyCommand
    end

    def test_parse_query_definition
      command = @parser.parse "how much is pish tegj glob glob ?"
      assert command.is_a? QueryAlienQuantityCommand
    end

    def test_parse_query_currency
      command = @parser.parse "how many Credits is glob prok Silver ?"
      assert command.is_a? QueryCurrencyCommand
    end

    def test_parse_invalid_query
      command = @parser.parse "how much wood could a woodchuck chuck if a woodchuck could chuck wood ?"
      assert_equal "I have no idea what you are talking about", command.execute
    end
  end
end
