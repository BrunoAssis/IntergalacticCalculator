require 'test_helper'

class QueryDefinitionCommandTest < Minitest::Test
  def setup
    @alien_converter = AlienConverter.new({"glob" => "I",
                                           "pish" => "X",
                                           "tegj" => "L"})
  end

  def test_valid_query_definition
    command = QueryDefinitionCommand.new "how much is pish tegj glob glob ?"
    assert_output("pish tegj glob glob is 42\n") {
      command.execute(@alien_converter)
    }
  end

  def test_valid_complex_query_definition
    command = QueryDefinitionCommand.new "how much is pish tegj glob pish ?"
    assert_output("pish tegj glob pish is 49\n") {
      command.execute(@alien_converter)
    }
  end

  def test_invalid_query_definition
    assert_raises(ArgumentError) {
      command = QueryDefinitionCommand.new
    }
  end
end
