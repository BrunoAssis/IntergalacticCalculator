require 'test_helper'

class QueryCurrencyCommandTest < Minitest::Test
  def setup
    @alien_converter = AlienConverter.new({"glob" => "I",
                                           "prok" => "V"})
    @currencies = {"Silver" => 17,
                   "Gold" => 10000000}
  end

  def test_valid_query_currency_silver
    command = QueryCurrencyCommand.new "how many Credits is glob prok Silver ?"
    assert_output("glob prok Silver is 68 Credits\n") {
      command.execute(@alien_converter, @currencies)
    }
  end

  def test_valid_query_currency_gold
    command = QueryCurrencyCommand.new "how many Credits is glob prok Gold ?"
    assert_output("glob prok Gold is 57800 Credits\n") {
      command.execute(@alien_converter, @currencies)
    }
  end

  def test_valid_query_currency_iron
    command = QueryCurrencyCommand.new "how many Credits is glob prok Iron ?"
    assert_output("glob prok Iron is 782 Credits\n") {
      command.execute(@alien_converter, @currencies)
    }
  end

  def test_invalid_query_currency
    assert_raises(ArgumentError) {
      command = QueryCurrencyCommand.new
    }
  end
end
