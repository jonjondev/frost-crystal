# Library Requirements
require "kemal"
require "json"

# File Requirements
require "./middleware/*"
require "./extension/*"
require "./helper/*"
require "./api/base_api"
require "./api/*"

# Includes
include ApplicationHelper

# Register Middlewares
register_middleware [ApiHandler]

# Main App Module (run on start)
module Frost::Crystal
  VERSION = "0.1.0"
  Kemal.run
end
