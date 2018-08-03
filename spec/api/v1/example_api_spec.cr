require "../../spec_helper"

describe V1::ExampleApi do
  # before_each do
  # end

  pending "index route" do
    context "when unauthenticated" do
      get("/api/v1/example")

      it "returns a not found" do
        status_code.should eq(404)
      end
    end
    context "when authenticated" do
      # TODO Add header
      get("/api/v1/example")

      it "successfully returns all examples" do
        status_code.should eq(200)
        body.should eq(Example.all.to_json)
      end
    end
  end

  pending "show route" do
    context "when unauthenticated" do
      if example = Example.first
        get("/api/v1/example/#{example.id}")

        it "returns a not found" do
          status_code.should eq(404)
        end
      end
    end
    context "when authenticated" do
      if example = Example.first
        # TODO Add header
        get("/api/v1/example/#{example.id}")

        it "successfully returns the example" do
          status_code.should eq(200)
          body.should eq(example.to_json)
        end
      end
    end
  end
end
