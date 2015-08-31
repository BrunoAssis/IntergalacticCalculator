class Command
  PATTERN = //

  attr_writer :code
  attr_reader :command_text

  def initialize(command_text)
    @command_text = command_text
    parse
  end

  def evaluate
    @code
  end

  def parse
    @code = command_text
  end
end
