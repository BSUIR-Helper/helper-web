require "spec_helper"

describe LectorsController do
  describe "routing" do

    it "routes to #index" do
      get("/lectors").should route_to("lectors#index")
    end

    it "routes to #new" do
      get("/lectors/new").should route_to("lectors#new")
    end

    it "routes to #show" do
      get("/lectors/1").should route_to("lectors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lectors/1/edit").should route_to("lectors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lectors").should route_to("lectors#create")
    end

    it "routes to #update" do
      put("/lectors/1").should route_to("lectors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lectors/1").should route_to("lectors#destroy", :id => "1")
    end

  end
end
