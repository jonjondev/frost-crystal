module Frost::ApiHelper
  # Get the server context for the request
  getter context : ::HTTP::Server::Context

  # Add context as an instance variable for Orion
  def initialize(@context)
  end

  # Gets a param from the path by name
  def param(param : String) : String
    context.request.path_params[param]
  end

  def param(body : JSON::Any, param : String) : String
    body[param].to_s
  end

  def fetch_body : JSON::Any
    JSON.parse(context.request.body.not_nil!.gets_to_end)
  end

  # Performs a response with provided content
  def respond(content)
    context.response.puts content.to_json
  end
end
