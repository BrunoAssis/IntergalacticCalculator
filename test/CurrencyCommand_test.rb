require 'test_helper'

class CurrencyCommandTest < Minitest::Test
  def test_valid_currency
    currency_command = CurrencyCommand.new "glob glob Silver is 34 Credits"
    expected = {"Silver" => 17}
    alien_converter = AlienConverter.new({"glob" => "I"})
    assert_equal expected, currency_command.execute(alien_converter)
  end

  def test_invalid_without_alien_converter
    command = CurrencyCommand.new "glob glob Silver is 34 Credits"
    assert_raises(ArgumentError) {
      command.execute
    }
  end

  def test_invalid_without_alien_converter_with_definition
    command = CurrencyCommand.new "glob glob Silver is 34 Credits"
    assert_raises(ArgumentError) {
      command.execute(AlienConverter.new({"pish" => "C"}))
    }
  end

  def test_invalid_currency
    assert_raises(ArgumentError) {
      command = CurrencyCommand.new
    }
  end
end
