require 'test_helper'

class AlienConverterTest < Minitest::Test
  def test_to_human
    alien_numeral = AlienConverter.new({"glob" => "I", "pish" => "X"})
    assert_equal 9, alien_numeral.to_human("glob pish")
  end

  def test_invalid_without_definitions
    assert_raises(ArgumentError) {
      alien_numeral = AlienConverter.new({})
    }
  end


  def test_invalid_without_single_definition
    alien_numeral = AlienConverter.new({"glob" => "I"})
    assert_raises(ArgumentError) {
      alien_numeral.to_human("glob fake")
    }
  end
end
