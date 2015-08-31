class InvalidCommand
  include Command

  def initialize
    @code = "puts 'I have no idea what you are talking about'"
  end
end
