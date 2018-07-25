module Frost::ServerHelper
  def start_server(on port : Int32)
    start_message(port)
    FrostApp.run(port)
  end

  private def start_message(port : Int32)
    puts "Running app version #{VERSION}"
  end
end
