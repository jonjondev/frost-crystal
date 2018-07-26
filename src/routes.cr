# The base routes defiition class
class FrostApp < Toro::Router
  def routes
    on "api" do
      on "example" do
        mount ExampleApi
      end
    end
  end
end
