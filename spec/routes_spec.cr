require "./spec_helper"

describe FrostApp do
  describe "base route" do
    get("/")
    it "returns a not found" do
      status_code.should eq(404)
    end
  end
  describe "base api route" do
    get("/api")
    it "returns a not found" do
      status_code.should eq(404)
    end
  end
  describe "version-spaced, base api route" do
    get("/api/v1")
    it "returns a not found" do
      status_code.should eq(404)
    end
  end
end
