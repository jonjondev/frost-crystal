ENV["ENV"] = "test"

# Require and include all testing libraries
require "spec"
require "mass_spec"
include MassSpec::GlobalDSL

# Start the server
require "../src/frost-crystal"

puts "\nRunning tests:"

# Turn off database logging
Granite.settings.logger = Logger.new(nil)
