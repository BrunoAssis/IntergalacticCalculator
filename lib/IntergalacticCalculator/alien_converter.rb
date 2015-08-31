module IntergalacticCalculator
  class AlienConverter
    def initialize(alien_numerals)
      @alien_numerals = alien_numerals || {}
    end

    def to_human(alien_numeral)
      roman_numeral = parse_roman alien_numeral
      roman_numeral.to_arabic
    end

    private
    def parse_roman(alien_numeral)
      roman_numeral = ""
      alien_digits = alien_numeral.split(" ")
      alien_digits.each do |alien_digit|
        if @alien_numerals.has_key? alien_digit
          roman_numeral << @alien_numerals[alien_digit]
        else
          raise ArgumentError, "Undefined alien numeral '#{alien_digit}'."
        end
      end
      RomanNumeral.new roman_numeral
    end
  end
end
