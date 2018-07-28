class V1::ExampleApi < Toro::Router
  include Frost::ApiHelper
  include Frost::SessionHelper

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

  # Association Methods

  def load_user(fetched_example)
    if example = fetched_example
      return example.user
    end
    return fetched_example
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
    if token_authenticate(header("AUTH_TOKEN"))
      get { json index }
      post { json create }
      on :id do
        on "user" { json load_user(show) }
        get { json show }
        put { json update }
        delete { json destroy }
      end
    end
    json({error: "Missing or invalid auth-token"})
  end
end
