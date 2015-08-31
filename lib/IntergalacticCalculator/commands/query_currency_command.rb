class QueryCurrencyCommand < Command
  PATTERN = /how many Credits is (?<alien_quantity>.*?) (?<currency>[A-Z][a-z]*) ?/

  def execute(alien_converter, currencies)
    matches = PATTERN.match @command_text
    alien_quantity = matches[:alien_quantity]
    human_quantity = alien_converter.to_human alien_quantity
    currency = matches[:currency]
    puts "#{asked_quantity} is #{quantity}"
  end
end
