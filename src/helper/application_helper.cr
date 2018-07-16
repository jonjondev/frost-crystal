module ApplicationHelper
  def register_middleware(middlewares : Array(Class))
    middlewares.each do |handler|
      add_handler handler.new
    end
  end
end
