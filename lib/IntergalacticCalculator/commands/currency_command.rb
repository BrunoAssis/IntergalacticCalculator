class CurrencyCommand < Command
  PATTERN = /(?<quantity>.*?) (?<currency>[A-Z][a-z]*?) is (?<value>\d+) Credits/

  def execute(definitions)
    if definitions != nil && definitions.empty?
      puts "Undefined alien quantities."
    else
      matches = PATTERN.match @command_text
      quantity = parse_quantity matches[:quantity], definitions
      currency = matches[:currency]
      single_value = parse_value(matches[:value], quantity)
      {currency => single_value}
    end
  end

  private
  def parse_quantity(quantity_text, definitions)
    roman_numeral = parse_roman(quantity_text, definitions)
    roman_numeral.to_arabic
  end

  def parse_roman(quantity_text, definitions)
    roman_numeral = ""
    quantities = quantity_text.split(" ")
    quantities.each do |quantity|
      if definitions.has_key? quantity
        roman_numeral << definitions[quantity]
      else
        raise ArgumentError, "Undefined alien quantity '#{quantity}'."
      end
    end
    RomanNumeral.new roman_numeral
  end

  def parse_value(value_text, quantity)
    value = value_text.to_i
    single_value = value / quantity
  end
end
