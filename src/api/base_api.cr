class BaseApi
  extend Formattable
  include ApiHelper

  def self.route(route : String)
    "/api" + route
  end

  before_all do |env|
    format_json env
  end

  get route("/") do |env|
    {greeting: "Hello World!"}.to_json
  end

  error 404 do |env|
    format_json env
    {error: "Resource not found"}.to_json
  end

  error 403 do |env|
    format_json env
    {error: "Cannot authenticate request"}.to_json
  end
end
