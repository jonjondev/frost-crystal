require "./spec_helper"

describe Frost::Main do
  it "works" do
    false.should eq(true)
  end

  it "returns the path in json" do
    get("/api/v1/user")

    status_code.should eq(200)
    headers.should contain({"Content-Type", ["application/json"]})
    # body.should eq(%({"path":"/nas/beru/uhn'adarr"}))
    # json_body.should eq({"path" => "/api/v1/user"})
  end
end
