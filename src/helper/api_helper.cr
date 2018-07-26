module Frost::ApiHelper
  # Gets a param from the path by name
  def param(param : Symbol) : String
    inbox[param]
  end

  # Gets a param from the request body by name
  def body(param) : String | Nil
    fetch_body
    begin
      @body.not_nil![param].to_s
    rescue KeyError
      puts "Unknown param #{param}"
    rescue error : Exception
      puts "Found empty request body: #{error.message}"
    end
  end

  # Fetches and parses the request body as JSON
  private def fetch_body
    begin
      @body = JSON.parse(context.request.body.as(IO).gets_to_end)
    rescue JSON::ParseException
    rescue error : TypeCastError
      puts "Bad request body: #{error.message}"
    end
  end
end
