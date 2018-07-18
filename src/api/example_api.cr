class ExampleApi
  include Frost::ApiHelper

  def index
    respond Example.all
  end

  def show
    respond load_example
  end

  def create
    body = fetch_body
    example = Example.create(name: param(body, "name"), description: param(body, "description"))
    respond example
  end

  def update
    body = fetch_body
    example = load_example
    example.name = param(body, "name") if param(body, "name")
    example.description = param(body, "description") if param(body, "description")
    example.update
    respond example
  end

  def destroy
    example = load_example
    example.delete
  end

  private def load_example : Example
    Example.get(param("id").to_i)
  end
end
