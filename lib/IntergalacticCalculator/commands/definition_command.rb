class DefinitionCommand < Command
  PATTERN = /(?<alien_numeral>.*?) is (?<roman_numeral>I|V|X|L|C|D|M)/

  def parse
    matches = PATTERN.match(@command_text)
    alien_numeral = matches[:alien_numeral]
    roman_numeral = matches[:roman_numeral]
    @code = "#{alien_numeral} = \"#{roman_numeral}\""
  end
end
