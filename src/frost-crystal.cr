# Version Number
VERSION = "0.1.0"

# Library Requirements
require "orion"
require "json"
require "topaz"
require "pg"

Topaz::Db.setup("postgres://frost:frost@localhost:5432/frost")

# File Requirements
require "./routes"
require "./utils/*"
require "./model/*"
require "./handler/*"
require "./helper/*"
require "./api/*"

# Includes
include Frost::ModelHelper
include Frost::ServerHelper

# Migrate DB
initialise_tables [Example]

# Start Server
start_server on: 3000
