class QueryDefinitionCommand < Command
  PATTERN = /how much is (?<quantity>.*?) \?/

  def execute(alien_converter)
    matches = PATTERN.match @command_text
    asked_quantity = matches[:quantity]
    quantity = alien_converter.to_arabic asked_quantity
    puts "#{asked_quantity} is #{quantity}"
  end
end
