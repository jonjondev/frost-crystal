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
      puts "Could not find param #{param}"
    rescue error : Exception
      puts "Found empty request body: #{error.message}"
    end
  end

  # Gets a param from the request body by name as an Int32
  def int_body(param) : Int32 | Nil
    if param = body(param)
      param.to_i
    end
  end

  # Gets a param from the request body by name
  def header(param) : String | Nil
    begin
      context.request.headers[param].to_s
    rescue KeyError
      puts "Could not find param #{param}" if ENV["ENV"] != "test"
    end
  end

  # Converts a string value into the ID format (Int64)
  def as_id(string_id) : Int64 | Nil
    if value = string_id
      Int64.new(value)
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
