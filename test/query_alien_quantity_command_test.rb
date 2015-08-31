require 'test_helper'
module IntergalacticCalculator
  class QueryAlienQuantityCommandTest < Minitest::Test
    def setup
      @alien_converter = AlienConverter.new({"glob" => "I",
                                             "pish" => "X",
                                             "tegj" => "L"})
    end

    def test_valid_query_definition
      command = QueryAlienQuantityCommand.new "how much is pish tegj glob glob ?"
      assert_equal "pish tegj glob glob is 42",
                   command.execute(alien_converter: @alien_converter)
    end

    def test_valid_complex_query_definition
      command = QueryAlienQuantityCommand.new "how much is pish tegj glob pish ?"
      assert_equal "pish tegj glob pish is 49",
                   command.execute(alien_converter: @alien_converter)
    end

    def test_invalid_query_definition
      assert_raises(ArgumentError) {
        command = QueryAlienQuantityCommand.new
      }
    end
  end
end
