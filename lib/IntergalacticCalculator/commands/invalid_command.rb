module IntergalacticCalculator
  class InvalidCommand < Command
    def initialize
    end

    def execute!(options = {})
      "I have no idea what you are talking about"
    end
  end
end
