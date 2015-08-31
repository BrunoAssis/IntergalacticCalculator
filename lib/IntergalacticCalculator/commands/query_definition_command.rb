class QueryDefinitionCommand < Command
  PATTERN = /how much is (?<alien_quantity>.*?) \?/

  def execute(alien_converter)
    matches = PATTERN.match @command_text
    alien_quantity = matches[:alien_quantity]
    human_quantity = alien_converter.to_human alien_quantity
    puts "#{alien_quantity} is #{human_quantity}"
  end
end
