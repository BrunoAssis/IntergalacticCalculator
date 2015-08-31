class AlienConverter
  def initialize(alien_numbers)
    if alien_numbers != nil && alien_numbers.empty?
      raise ArgumentError, "Undefined alien numbers."
    else
      @alien_numbers = alien_numbers
    end
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
      if @alien_numbers.has_key? alien_digit
        roman_numeral << @alien_numbers[alien_digit]
      else
        raise ArgumentError, "Undefined alien number '#{alien_digit}'."
      end
    end
    RomanNumeral.new roman_numeral
  end
end
