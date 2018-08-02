require "../../spec_helper"

describe V1::UserApi do
  describe "index route" do
    get("/api/v1/user")

    it "successfully returns all users" do
      status_code.should eq(200)
      body.should eq(User.all.to_json)
    end
  end
  describe "show route" do
    if user = User.first
      get("/api/v1/user/#{user.id}")

      it "successfully returns the user" do
        status_code.should eq(200)
        body.should eq(user.to_json)
      end
    end
  end
end
