require 'test_helper'

class RomanNumeralTest < Minitest::Test
  def test_IV_to_arabic
    roman_numeral = RomanNumeral.new("IV")
    assert_equal 4, roman_numeral.to_arabic
  end

  def test_complex_to_arabic
    roman_numeral = RomanNumeral.new("MMDCLXVI")
    assert_equal 2666, roman_numeral.to_arabic
  end

  def test_invalid_roman_numeral
    roman_numeral = RomanNumeral.new("IIII")
    assert_raises(ArgumentError) {
      roman_numeral.to_arabic
    }
  end

  def test_invalid_order
    roman_numeral = RomanNumeral.new("LM")
    assert_raises(ArgumentError) {
      roman_numeral.to_arabic
    }
  end
end
