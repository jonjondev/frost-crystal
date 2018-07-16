class ExampleApi < BaseApi
  extend ApiHelper

  @@namespace = "/example"

  before_all do |env|
    set_json_content env
  end

  get route("/hi") do |env|
    {greeting: "Hello, this is the example API module!"}.to_json
  end
end
