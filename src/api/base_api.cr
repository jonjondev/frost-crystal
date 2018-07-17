class BaseApi
  include ApiHelper

  def self.base_route(route : String)
    "/api" + route
  end

  before_all do |env|
    ApiHelper.set_json_content env
  end

  get base_route("/") do |env|
    {greeting: "Hello World!"}.to_json
  end

  error 404 do |env|
    ApiHelper.set_json_content env
    {error: "Resource not found"}.to_json
  end

  error 403 do |env|
    ApiHelper.set_json_content env
    {error: "Cannot authenticate request"}.to_json
  end
end
