# The base routes defiition class
class FrostApp < Toro::Router
  def routes
    on "api" do
      on "example" do
        mount ExampleApi
      end
      on "user" do
        mount UserApi
      end
    end
  end
end
