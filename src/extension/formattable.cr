module Formattable
  private def format_json(env)
    env.response.content_type = "application/json"
  end
end
