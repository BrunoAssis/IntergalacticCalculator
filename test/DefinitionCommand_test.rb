require 'test_helper'

class DefinitionCommandTest < Minitest::Test
  def test_valid_definition
    command = DefinitionCommand.new "glob is I"
    assert command.execute, {glob: "I"}
  end

  def test_invalid_definition
    assert_raises(ArgumentError) {
      command = DefinitionCommand.new
    }
  end
end
