require 'test_helper'

class CurrencyCommandTest < Minitest::Test
  def test_valid_currency
    currency_command = CurrencyCommand.new "glob glob Silver is 34 Credits"
    expected = {"Silver" => 17}
    alien_converter = AlienConverter.new({"glob" => "I"})
    assert_equal expected, currency_command.execute(alien_converter)
  end

  def test_invalid_currency
    assert_raises(ArgumentError) {
      command = CurrencyCommand.new
    }
  end
end
