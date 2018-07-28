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
    example = populate_example(Example.new)
    save_example(example)
  end

  def update
    if example = load_example
      populate_example(example)
      save_example(example)
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

  def populate_example(example : Example) : Example
    example.name = body("name") || example.name
    example.description = body("description") || example.description
    example.user_id = as_id(body("user_id")) || example.user_id
    return example
  end

  def save_example(example : Example) : Example | NamedTuple(error: String)
    example.save ? example : {error: "Error saving example"}
  end

  # Route Definitions
  def routes
    get { json index }
    post { json create }
    on :id do
      # on "user" { json load_user(show.id) }
      get { json show }
      put { json update }
      delete { json destroy }
    end
  end
end
