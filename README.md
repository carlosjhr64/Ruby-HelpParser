# Help Parser
## V: Infamous

* [github](https://www.github.com/carlosjhr64/Ruby-HelpParser)
* [rubygems](https://rubygems.org/gems/help_parser)

## DESCRIPTION:
All help is about to get parsed...
Again!!!

And this time,
the battle between complexity and simplicity
has as familiar text.

## SYNOPSIS:

    require "pp"
    require "help_parser"

    HELP = <<-HELP
    The Awesome Command.
    Usage:
      awesome [:options+] <args>+
      awesome :alternate <arg=NAME>
    Options:
      -v --version       \t Give version and quit
      -h --help          \t Give help and quit
      -s --long          \t Short long synonyms
      --name=NAME        \t Typed
      --number 5         \t Defaulted
      --value=FLOAT 1.23 \t Typed and Defaulted
      -a --all=YN y      \t Short, long, typed, and defaulted
    Alternate:
      -V                 \t Just short
    Types:
      NAME  /^[A-Z][a-z]+$/
      FLOAT /^\\d+\\.\\d+$/
      YN    /^[YNyn]$/
    HELP

    VERSION = "5.0.0"

    # Macros:
    HelpParser.string(name)  # for options.name   : String
    HelpParser.strings(args) # for options.args   : Array(String)
    HelpParser.float(value)  # for options.value  : Float
    HelpParser.int?(number)  # for options.number : Int32 | Nil

    HelpParser.run(VERSION, HELP) do |options|
      hash = options._hash
      pp hash # to inspect the hash

      pp options.name  if hash["name"]?
      pp options.args  if hash["args"]?
      pp options.value if hash["value"]?
      pp options.number?
    end

YES!!!

## INSTALL:

    $ sudo gem install help_parser
