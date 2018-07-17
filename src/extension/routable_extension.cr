module Routable
  def route(route : String)
    base_route(@@namespace + route)
  end

  def base_route(route : String)
    super
  end
end
