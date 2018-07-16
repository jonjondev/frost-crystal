module Routable
  def route(route : String)
    puts base_route(@@namespace + route)
    base_route(@@namespace + route)
  end

  def base_route(route : String)
    super
  end
end
