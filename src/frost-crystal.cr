# Version Number
VERSION = "0.1.0"

# Library Requirements
require "orion"
require "json"
require "granite/adapter/pg"

# File Requirements
require "./routes"
require "./model/*"
require "./handler/*"
require "./helper/*"
require "./api/*"

# Includes
include Frost::ModelHelper
include Frost::ServerHelper

# Migrate DB
initialise_tables [User]

# Start Server
start_server on: 3000
