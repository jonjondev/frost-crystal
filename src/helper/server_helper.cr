module Frost::ServerHelper
  def start_server(on port : Int32)
    puts "Running app version #{VERSION}"
    FrostApp.run(port)
  end
end
