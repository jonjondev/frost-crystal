module Routable
  private def route(route : String)
    super @@namespace + route
  end
end
