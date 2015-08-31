class Command
  PATTERN = //

  attr_reader :command_text

  def initialize(command_text)
    @command_text = command_text
  end

  def execute
    nil
  end
end
