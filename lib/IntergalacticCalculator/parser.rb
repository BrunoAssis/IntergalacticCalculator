class Parser
  def initialize
    @valid_commands = [DefinitionCommand,
                       CurrencyCommand,
                       QueryDefinitionCommand,
                       QueryCurrencyCommand]
    @invalid_command = InvalidCommand
  end

  def parse(text)
    text.gsub!(/[\r\n]/, '')
    command = nil

    @valid_commands.each do |command_class|
      if text =~ command_class::PATTERN
        command = command_class.new text
      end
    end

    unless command
      command = @invalid_command.new
    end

    command
  end
end
