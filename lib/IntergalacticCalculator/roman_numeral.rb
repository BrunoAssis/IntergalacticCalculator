class RomanNumeral
  MAPPING = {
    "M"   => 1000,
    "CM"  => 900,
    "D"   => 500,
    "CD"  => 400,
    "C"   => 100,
    "XC"  => 90,
    "L"   => 50,
    "XL"  => 40,
    "X"   => 10,
    "IX"  => 9,
    "V"   => 5,
    "IV"  => 4,
    "I"   => 1
  }

  def initialize(roman_numeral)
    @roman_numeral = roman_numeral
  end

  def to_arabic
    if is_invalid? @roman_numeral
      raise ArgumentError, "Wrong Roman Numeral"
    else
      result = 0
      roman_string = @roman_numeral
      MAPPING.each do |roman, value|
        while roman_string.start_with?(roman)
          result += value
          roman_string.slice!(0, roman.length)
        end
      end
      result
    end
  end

  private
  def is_invalid?(roman_numeral)
    roman_numeral !~ /^(M{0,4})(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
  end
end
