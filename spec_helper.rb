# Helper file to setup our tests/specs for this program.
# NO NEED TO EDIT

require 'pry'
require 'rspec/its'


# require 'rspec'
# format NyanCatFormatter


def safely_require(file)
  require_relative file
rescue LoadError
  # ignore
end

# safely_require 'main'
safely_require 'contact'
safely_require 'application'
