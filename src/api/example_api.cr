class ExampleApi
  include Frost::ApiHelper

  def index
    respond({route: "index"}.to_json)
  end

  def create
    respond({route: "create"}.to_json)
  end

  def show
    id = param("id").to_i
    respond({route: "show", id: id}.to_json)
  end

  def update
    respond({route: "update"}.to_json)
  end

  def destroy
    respond({route: "destroy"}.to_json)
  end
end
