require "redis"

module Frost::SessionHelper
  def authenticate!
    if auth_header = header("Authorization")
      token = auth_header.gsub("Bearer ", "")
      token_authenticate(token)
    end
  end

  def token_authenticate(token)
    user_id = Redis.new.get(token)
    User.find(user_id)
  end

  def verify_password?(user : User, unvalidated_password : String | Nil) : Bool
    (password = unvalidated_password) ? user.password == password : false
  end

  def create_token(user : User)
    auth_token = Random.new.urlsafe_base64(64)
    Redis.new.set(auth_token, user.id, 86_400)
    auth_token
  end

  def invalidate_token(auth_token : String | Nil)
    Redis.new.del(auth_token) == 1
  end
end
