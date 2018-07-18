module Frost
  class JsonHandler
    include HTTP::Handler

    def call(context)
      context.response.content_type = "application/json"
      call_next(context)
    end
  end
end
