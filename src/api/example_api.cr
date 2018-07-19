class ExampleApi
  include Frost::ApiHelper

  def index
    Example.create(name: "Test", body: "Data")
    respond Example.all
  end

  def show
    # respond load_example
  end

  def create
    # example = Example.create(name: body("name"), description: body("description"))
    # respond example
  end

  def update
    # body = fetch_body
    # example = load_example
    # example.name = body("name") if body("name")
    # example.description = body("description") if body("description")
    # example.update
    # respond example
  end

  def destroy
    # example = load_example
    # example.delete
  end

  private def load_example : Example
    # Example.get(param("id").to_i)
  end
end
