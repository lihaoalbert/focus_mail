require "spec_helper"

describe ClicksController do
  describe "routing" do

    it "routes to #index" do
      get("/clicks").should route_to("clicks#index")
    end

    it "routes to #new" do
      get("/clicks/new").should route_to("clicks#new")
    end

    it "routes to #show" do
      get("/clicks/1").should route_to("clicks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clicks/1/edit").should route_to("clicks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clicks").should route_to("clicks#create")
    end

    it "routes to #update" do
      put("/clicks/1").should route_to("clicks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clicks/1").should route_to("clicks#destroy", :id => "1")
    end

  end
end
