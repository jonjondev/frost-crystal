module ApiHelper
  def route(route : String)
    puts base_route(@@namespace + route)
    base_route(@@namespace + route)
  end

  def base_route(route : String)
    super
  end

  def set_json_content(env)
    env.response.content_type = "application/json"
  end
end
