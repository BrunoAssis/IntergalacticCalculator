require 'test_helper'

class CurrencyCommandTest < Minitest::Test
  def test_valid_currency
    definition_command = DefinitionCommand.new "glob is I"
    definitions = definition_command.execute
    currency_command = CurrencyCommand.new "glob glob Silver is 34 Credits"
    expected = {"Silver" => 17}
    assert_equal expected, currency_command.execute(definitions)
  end

  def test_invalid_without_definitions
    assert_output("Undefined alien quantities.\n") {
      command = CurrencyCommand.new "glob glob Silver is 34 Credits"
      command.execute({})
    }
  end


  def test_invalid_without_single_definition
    assert_raises(ArgumentError) {
      command = CurrencyCommand.new "glob glob Silver is 34 Credits"
      command.execute({'pish': 'C'})
    }
  end

  def test_invalid_currency
    assert_raises(ArgumentError) {
      command = CurrencyCommand.new
    }
  end
end
