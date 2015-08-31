class DefinitionCommand
  include Command

  def initialize(alien_numeral, roman_numeral)
    @alien_numeral = alien_numeral
    @roman_numeral = roman_numeral
    set_code
  end

  def set_code
    @code = "#{@alien_numeral} = \"@roman_numeral\""
  end
end
