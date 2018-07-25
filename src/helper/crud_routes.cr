module Frost::CrudRoutes
  def routes
    get { index }
    post { create }
    on :id do
      get { show }
      put { update }
      delete { destroy }
    end
  end
end
