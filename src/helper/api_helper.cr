module Frost::ApiHelper
  # Get the server context for the request
  getter context : ::HTTP::Server::Context

  # Add context as an instance variable for Orion
  def initialize(@context)
  end

  # Gets a param from the path by name
  def param(param : String)
    context.request.path_params[param]
  end

  # Performs a response with provided content
  def respond(content)
    context.response.puts content
  end
end
