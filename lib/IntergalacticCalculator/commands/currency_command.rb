class CurrencyCommand < Command
  PATTERN = /(?<quantity>.*?) (?<currency>[A-Z][a-z]*?) is (?<value>\d+) Credits/

  def execute(alien_converter)
    matches = PATTERN.match @command_text
    quantity = alien_converter.to_arabic matches[:quantity]
    currency = matches[:currency]
    single_value = parse_value(matches[:value], quantity)
    {currency => single_value}
  end

  private
  def parse_value(value_text, quantity)
    value = value_text.to_i
    single_value = value / quantity
  end
end
