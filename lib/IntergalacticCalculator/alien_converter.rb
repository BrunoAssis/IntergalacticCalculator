class AlienConverter
  def initialize(definitions)
    if definitions != nil && definitions.empty?
      raise ArgumentError, "Undefined alien quantities."
    else
      @definitions = definitions
    end
  end

  def to_arabic(alien_numeral)
    roman_numeral = parse_roman alien_numeral
    roman_numeral.to_arabic
  end

  private
  def parse_roman(alien_numeral)
    roman_numeral = ""
    quantities = alien_numeral.split(" ")
    quantities.each do |quantity|
      if @definitions.has_key? quantity
        roman_numeral << @definitions[quantity]
      else
        raise ArgumentError, "Undefined alien quantity '#{quantity}'."
      end
    end
    RomanNumeral.new roman_numeral
  end
end
