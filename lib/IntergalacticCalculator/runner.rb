def not_passed_file
  %q{Please, specify a file:
intergalactic_calculator [input_file]
Usage example:
intergalactic_calculator example_file.txt}
end

def not_valid_file(filename)
  "The selected filename #{filename} is not a valid file."
end

filename = ARGV[0]

unless filename
  puts not_passed_file
else
  unless File.file? filename
    puts not_valid_file filename
  else
    parser = Parser.new
    File.foreach(filename) do |line|
      command = parser.parse line
      eval command.evaluate
    end
  end
end
