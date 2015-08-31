require 'test_helper'
module IntergalacticCalculator
  class SetAlienNumeralCommandTest < Minitest::Test
    def test_valid_definition
      command = SetAlienNumeralCommand.new "glob is I"
      assert command.execute!, {glob: "I"}
    end

    def test_invalid_definition
      assert_raises(ArgumentError) {
        command = SetAlienNumeralCommand.new
      }
    end
  end
end
