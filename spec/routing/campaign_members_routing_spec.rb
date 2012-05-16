require "spec_helper"

describe CampaignMembersController do
  describe "routing" do

    it "routes to #index" do
      get("/campaign_members").should route_to("campaign_members#index")
    end

    it "routes to #new" do
      get("/campaign_members/new").should route_to("campaign_members#new")
    end

    it "routes to #show" do
      get("/campaign_members/1").should route_to("campaign_members#show", :id => "1")
    end

    it "routes to #edit" do
      get("/campaign_members/1/edit").should route_to("campaign_members#edit", :id => "1")
    end

    it "routes to #create" do
      post("/campaign_members").should route_to("campaign_members#create")
    end

    it "routes to #update" do
      put("/campaign_members/1").should route_to("campaign_members#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/campaign_members/1").should route_to("campaign_members#destroy", :id => "1")
    end

  end
end
