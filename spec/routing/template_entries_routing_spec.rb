require "spec_helper"

describe TemplateEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/template_entries").should route_to("template_entries#index")
    end

    it "routes to #new" do
      get("/template_entries/new").should route_to("template_entries#new")
    end

    it "routes to #show" do
      get("/template_entries/1").should route_to("template_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/template_entries/1/edit").should route_to("template_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/template_entries").should route_to("template_entries#create")
    end

    it "routes to #update" do
      put("/template_entries/1").should route_to("template_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/template_entries/1").should route_to("template_entries#destroy", :id => "1")
    end

  end
end
