class ExampleApi < Toro::Router
  include Frost::ApiHelper

  # Route Methods

  def index
    Example.all
  end

  def show
    load_example
  end

  def create
    Example.create(
      name: body("name")
    )
  end

  def update
    if example = load_example
      example.name = body("name") || example.name
      example.save
    else
      {error: "Example not found"}
    end
  end

  def destroy
    if example = load_example
      example.destroy
    else
      {error: "Example not found"}
    end
  end

  # Helper Methods

  def load_example : Example | Nil
    Example.find(param(:id))
  end

  # Routes Definition
  def routes
    get { json index }
    post { json create }
    on :id do
      # on "another" { json load_another(show.id) }
      get { json show }
      put { update }
      delete { json destroy }
    end
  end
end
