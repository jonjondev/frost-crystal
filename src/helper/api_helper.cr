module ApiHelper
  def self.set_json_content(env)
    env.response.content_type = "application/json"
  end
end
