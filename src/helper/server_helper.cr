module Frost::ServerHelper
  def start_server(on port : Int32)
    start_message(port)
    ApplicationRouter.listen(port: port)
  end

  private def start_message(port : Int32)
    puts "Running app version #{VERSION}"
    puts "Frost is listening at http://0.0.0.0:#{port}..."
    puts "--------------------------------------------"
  end
end
