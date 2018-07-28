class V1::SessionApi < Toro::Router
  include Frost::ApiHelper
  include Frost::SessionHelper

  # Route Methods

  def create
    user = User.find_by(email: body("email"))
    if user && verify_password?(user, body("password"))
      {auth_token: create_token(user)}
    else
      {error: "Incorrect email or password"}
    end
  end

  def destroy
    {result: invalidate_token(body("auth_token"))}
  end

  # Route Definitions
  def routes
    post { json create }
    delete { json destroy }
  end
end
