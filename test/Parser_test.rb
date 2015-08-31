require 'test_helper'

class ParserTest < Minitest::Test
  def test_parse_definition
    parser = Parser.new
    command = parser.parse "glob is I"
    assert command.is_a? DefinitionCommand
  end
end
