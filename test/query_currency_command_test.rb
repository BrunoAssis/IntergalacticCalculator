require 'test_helper'
module IntergalacticCalculator
  class QueryCurrencyCommandTest < Minitest::Test
    def setup
      @alien_converter = AlienConverter.new({"glob" => "I",
                                             "prok" => "V"})
      @currencies = {"Silver" => 17,
                     "Gold" => 14450,
                     "Iron" => 195.5}
    end

    def test_valid_query_currency_silver
      command = QueryCurrencyCommand.new "how many Credits is glob prok Silver ?"
      assert_equal "glob prok Silver is 68 Credits",
                   command.execute(alien_converter: @alien_converter,
                                   currencies: @currencies)
    end

    def test_valid_query_currency_gold
      command = QueryCurrencyCommand.new "how many Credits is glob prok Gold ?"
      assert_equal "glob prok Gold is 57800 Credits",
                   command.execute(alien_converter: @alien_converter,
                                   currencies: @currencies)
    end

    def test_valid_query_currency_iron
      command = QueryCurrencyCommand.new "how many Credits is glob prok Iron ?"
      assert_equal "glob prok Iron is 782 Credits",
                   command.execute(alien_converter: @alien_converter,
                                   currencies: @currencies)
    end


    def test_inexistant_currency
      command = QueryCurrencyCommand.new "how many Credits is glob prok Crystal ?"
      assert_raises(ArgumentError) {
        command.execute(@alien_converter, @currencies)
      }
    end

    def test_invalid_query_currency
      assert_raises(ArgumentError) {
        command = QueryCurrencyCommand.new
      }
    end
  end
end
