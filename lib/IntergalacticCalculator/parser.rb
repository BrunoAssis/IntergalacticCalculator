class Parser
  def parse(text)
    text.gsub!(/[\r\n]/, '')
    if text =~ /(.*?) is (I|V|X|L|C|D|M)/
      DefinitionCommand.new
    elsif text =~ /(.*?) ([A-Z][a-z]*) is (\d+) Credits/
      CurrencyCommand.new
    elsif text =~ /how much is (.*?) ?/
      QueryDefinitionCommand.new
    elsif text =~ /how many Credits is (.*?) ([A-Z][a-z]*) ?/
      QueryCurrencyCommand.new
    else
      InvalidCommand.new
    end
  end
end
