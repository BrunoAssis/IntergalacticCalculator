require 'test_helper'

class QueryDefinitionCommandTest < Minitest::Test
  def setup
    set_definitions
  end

  def test_valid_currency
    command = QueryDefinitionCommand.new "how much is pish tegj glob glob ?"
    assert_output("pish tegj glob glob is 42\n") {
      command.execute(@definitions)
    }
  end

  def test_invalid_without_definitions
    command = QueryDefinitionCommand.new "how much is shak tump ?"
    assert_output("Undefined alien quantity.\n") {
      command.execute(@definitions)
    }
  end

  def test_invalid_query_definition
    assert_raises(ArgumentError) {
      command = QueryDefinitionCommand.new
    }
  end

  private
  def set_definitions
    @definitions = {}
    definition_command = DefinitionCommand.new "glob is I"
    @definitions.merge! definition_command.execute
    definition_command = DefinitionCommand.new "pish is X"
    @definitions.merge! definition_command.execute
    definition_command = DefinitionCommand.new "tegj is L"
    @definitions.merge! definition_command.execute
  end
end
