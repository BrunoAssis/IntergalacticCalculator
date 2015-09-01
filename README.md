# Intergalactic Calculator

A solved **"Merchant's Guide to the Galaxy"** challenge.

## Introduction

I chose to create this utility as a gem that also works standalone, because I
think its use-case scenario is a perfect fit for it. It is a highly specialized
and small application, so I think it makes sense to use it standalone or bundled
in another app.

To use it alone, you would [install the gem](#installation) and run its binary,
like so:
    $ intergalactic_calculator example_input.txt

As you specifically asked to not send ANY executable files in the submission,
I removed the bin/ folder from the project, but it can be seen on the [project's
repo](https://www.github.com/BrunoAssis/IntergalacticCalculator). To make it
easier to run it without its binaries, I created a "run.rb" file that works
[as an entry-point](#how-to-run-the-application) for the application.

To run it bundled in another app (*e.g.* a Rails app), you would add
"gem 'intergalactic_calculator'" to your Gemfile and then "bundle install" it.
After that, you would use it like this:

```ruby
require "IntergalacticCalculator"

filename = "example_input.txt"
calculator = IntergalacticCalculator::Calculator.new
calculator.calculate! filename
```

Although it prints to the screen and have some unusual behaviour for a gem (as
it should not interfere with the output of the application), it can be easily
modified to just return the values instead of "processing" and "working" them.

I hope you like it ;)

## Design

The code is pretty straightforward, and it follows the gem standard of having
all relevant code in the lib/ folder, and its tests in the test/ folder. The
entry-point for the application lies in the "run.rb" file (or the
bin/intergalactic_calculator if you can access it), which instantiates the
calculator and uses it in a target file.

Most of the logic in the Parser and the Calculator is generic, and the logic in
the lib/IntergalacticCalculator/commands/ is more domain-specific and
self-contained so we could add more commands to our calculator if needed, with
little modification of the Parser itself.

The tests use MiniTest (which comes bundled with Ruby) and can be run using:

    $ rake test

I've included two example input files. *example_input_1.txt* includes the same
examples given in the challenge, and *example_input_2.txt* includes some new
examples to show the application working with a different dataset.

## Assumptions

I've assumed that every "alien" and "currency" names will be provided by the
user, so the program works if you run it with the provided examples, or if you
make up your own:

example_input.txt (excerpt)
    glob is I
    glob glob Silver is 34 Credits
    how much is pish tegj glob glob ?
    how many Credits is glob prok Silver ?

example_input_2.txt (excerpt)
    pacoca is I
    pacoca karen Diamante is 200 Credits
    how many Credits is bruno karen Diamante ?

## How To Run The Application

Run the following command to see the program output:

    $ ruby run.rb example_input.txt
    $ ruby run.rb example_input_2.txt

Below [you can see more ways to use it](#usage), if it was used in a
"real-world" scenario.

## Installation

If you want to run it as a "standalone application" (the same way you run 'gem'
or 'bundle' for instance), clone this repository to your local machine, then do:

    $ rake install

It is not in RubyGems for privacy reasons, but it's almost ready to be pushed
if it was necessary.

## Usage

1) If you don't have access to the binaries (which is the case of this
submission), just run:

    $ ruby run.rb example_input.txt

2) If you had [installed it](#installation), run:

    $ intergalactic_calculator example_input.txt

3) If you have access to the bin/ folder (not the case of this submission),
run from the project root:

    $ bin/intergalactic_calculator example_input.txt

4) In a [bundled application](#introduction).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BrunoAssis/IntergalacticCalculator.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
