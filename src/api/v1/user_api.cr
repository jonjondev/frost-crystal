class V1::UserApi < Toro::Router
  include Frost::ApiHelper

  # Route Methods

  def index
    User.all
  end

  def show
    load_user
  end

  def create
    user = populate_user(User.new)
    save_user(user)
  end

  def update
    if user = load_user
      populate_user(user)
      save_user(user)
    else
      {error: "User not found"}
    end
  end

  def destroy
    if user = load_user
      user.destroy
    else
      {error: "User not found"}
    end
  end

  # Association Methods

  def load_examples(fetched_user)
    if user = fetched_user
      return user.examples
    end
    return fetched_user
  end

  # Helper Methods

  def load_user : User | Nil
    User.find(param(:id))
  end

  def populate_user(user : User) : User
    user.first_name = body("first_name") || user.first_name
    user.last_name = body("last_name") || user.last_name
    user.email = body("email") || user.email
    user.password = body("password") || user.password_hash
    return user
  end

  def save_user(user : User) : User | NamedTuple(error: String)
    user.save ? user : {error: "Error saving user"}
  end

  # Route Definitions
  def routes
    get { json index }
    post { json create }
    on :id do
      on "examples" { json load_examples(show) }
      get { json show }
      put { json update }
      delete { json destroy }
    end
  end
end
