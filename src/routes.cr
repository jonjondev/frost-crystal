# The base routes defiition class
class FrostApp < Toro::Router
  def routes
    on "api" do
      on "v1" do
        on "user" do
          mount V1::UserApi
        end
        on "example" do
          mount V1::ExampleApi
        end
      end
    end
  end
end
