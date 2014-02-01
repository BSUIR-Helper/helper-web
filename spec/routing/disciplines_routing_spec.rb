require "spec_helper"

describe DisciplinesController do
  describe "routing" do

    it "routes to #index" do
      get("/disciplines").should route_to("disciplines#index")
    end

    it "routes to #new" do
      get("/disciplines/new").should route_to("disciplines#new")
    end

    it "routes to #show" do
      get("/disciplines/1").should route_to("disciplines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/disciplines/1/edit").should route_to("disciplines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/disciplines").should route_to("disciplines#create")
    end

    it "routes to #update" do
      put("/disciplines/1").should route_to("disciplines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/disciplines/1").should route_to("disciplines#destroy", :id => "1")
    end

  end
end
