module IntergalacticCalculator
  class QueryAlienQuantityCommand < Command
    PATTERN = /how much is (?<alien_quantity>.*?) \?/

    def execute(options = {})
      alien_converter = options[:alien_converter]
      matches = PATTERN.match @command_text
      alien_quantity = matches[:alien_quantity]
      human_quantity = alien_converter.to_human alien_quantity
      "#{alien_quantity} is #{human_quantity}"
    end
  end
end
