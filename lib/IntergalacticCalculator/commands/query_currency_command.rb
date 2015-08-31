module IntergalacticCalculator
  class QueryCurrencyCommand < Command
    PATTERN = /how many Credits is (?<alien_quantity>.*?) (?<currency>[A-Z][a-z]*) ?/

    def execute(alien_converter, currencies)
      matches = PATTERN.match @command_text
      alien_quantity = matches[:alien_quantity]
      human_quantity = alien_converter.to_human alien_quantity
      currency = parse_currency(matches[:currency], currencies)
      credits_value = convert_quantity_to_credits(human_quantity, currencies[currency])
      "#{alien_quantity} #{currency} is #{credits_value} Credits"
    end

    private
    def convert_quantity_to_credits(quantity, exchange_rate)
      credits = quantity * exchange_rate
      prettify_credits credits
    end

    def prettify_credits(credits)
      credits == credits.to_i ? credits.to_i : credits
    end

    def parse_currency(asked_currency, currencies)
      if currencies.has_key? asked_currency
        asked_currency
      else
        raise ArgumentError, "I have no information for the '#{asked_currency}' currency."
      end
    end
  end
end
