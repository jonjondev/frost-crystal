class ExampleApi < BaseApi
  extend Routable

  @@namespace = "/example"

  get route("/hi") do |env|
    {greeting: "Hello, this is the example API module!"}.to_json
  end
end
