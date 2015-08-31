require 'test_helper'
module IntergalacticCalculator
  class SetCurrencyCommandTest < Minitest::Test
    def test_valid_currency
      command = SetCurrencyCommand.new "glob glob Silver is 34 Credits"
      alien_converter = AlienConverter.new({"glob" => "I"})
      assert_equal({"Silver" => 17}, command.execute(alien_converter: alien_converter))
    end

    def test_invalid_currency
      assert_raises(ArgumentError) {
        command = SetCurrencyCommand.new
      }
    end
  end
end
