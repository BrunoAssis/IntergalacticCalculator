require 'test_helper'

class DefinitionCommandTest < Minitest::Test
  def test_valid_definition
    command = DefinitionCommand.new "glob", "I"
    assert command.evaluate, "glob = \"I\""
  end

  def test_invalid_definition
    assert_raises(ArgumentError) {
      command = DefinitionCommand.new
    }
  end
end
