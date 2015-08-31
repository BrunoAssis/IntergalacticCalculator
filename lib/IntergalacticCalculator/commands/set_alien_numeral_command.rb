module IntergalacticCalculator
  class SetAlienNumeralCommand < Command
    PATTERN = /(?<alien_numeral>.*?) is (?<roman_numeral>I|V|X|L|C|D|M)/

    def execute!(options = {})
      options[:alien_numerals] ||= {}
      matches = PATTERN.match @command_text
      alien_numeral = matches[:alien_numeral]
      roman_numeral = matches[:roman_numeral]
      options[:alien_numerals].merge!({alien_numeral => roman_numeral})
    end
  end
end
