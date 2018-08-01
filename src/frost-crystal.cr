# Version Number
VERSION = "0.1.0"

# Library Requirements
require "toro"
require "json"
require "granite/adapter/pg"

# File Requirements
require "./routes"
require "./model/*"
require "./helper/*"
require "./api/**"

module Frost::Main
  # Includes
  extend Frost::DatabaseHelper
  extend Frost::ServerHelper

  # Setup DB
  initialise_tables [User, Example]

  # Start Server
  start_server on: 3000
end
