class BaseApi
  include ApiHelper

  def self.base_route(route : String)
    "/api" + route
  end

  get base_route("/") do |env|
    {greeting: "Hello World!"}.to_json
  end
end
