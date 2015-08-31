module IntergalacticCalculator
  class SetCurrencyCommand < Command
    PATTERN = /(?<alien_quantity>.*?) (?<currency>[A-Z][a-z]*?) is (?<total_value>\d+) Credits/

    def execute!(options = {})
      options[:currencies] ||= {}
      alien_converter = options[:alien_converter]
      matches = PATTERN.match @command_text
      human_quantity = alien_converter.to_human matches[:alien_quantity]
      currency = matches[:currency]
      single_value = parse_value(matches[:total_value], human_quantity)
      options[:currencies].merge!({currency => single_value})
    end

    private
    def parse_value(total_value_text, quantity)
      total_value = total_value_text.to_i
      single_value = total_value.to_f / quantity
    end
  end
end
