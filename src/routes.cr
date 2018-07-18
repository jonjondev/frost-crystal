router ApplicationRouter do
  use HTTP::LogHandler
  use HTTP::ErrorHandler
  use Frost::JsonHandler.new

  scope "api" do
    scope "example" do
      get "", to: "ExampleApi#index"
      post "", to: "ExampleApi#create"
      get ":id", to: "ExampleApi#show"
      put ":id", to: "ExampleApi#update"
      delete ":id", to: "ExampleApi#destroy"
    end
  end
end
