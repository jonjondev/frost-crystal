module Frost::ApiHelper
  # Get the body of the request
  @body = JSON::Any.new(nil)

  # Add context as an instance variable for Orion
  def initialize
    unless context.request.body.nil?
      @body = fetch_body
    end
  end

  # Gets a param from the path by name
  def param(param : String) : String
    context.request.path_params[param]
  end

  # Gets a param from the request body by name
  def body(param : String) : String
    @body[param].to_s
  end

  # Fetches and parses the request body as JSON
  private def fetch_body : JSON::Any
    JSON.parse(context.request.body.not_nil!.gets_to_end)
  end
end
