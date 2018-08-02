require "../../spec_helper"

describe V1::UserApi do
  describe "index route" do
    get("/api/v1/user")
    it "returns a success" do
      status_code.should eq(200)
      # headers.should contain({"Content-Type", ["application/json"]})
      # body.should eq(%({"path":"/nas/beru/uhn'adarr"}))
      # json_body.should eq({"path" => "/api/v1/user"})
    end

    it "returns all users" do
      body.should eq(User.all.to_json)
    end
  end
end
