require "spec_helper"

describe UpdatedObjectsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/updated_objects" }.should route_to(:controller => "updated_objects", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/updated_objects/new" }.should route_to(:controller => "updated_objects", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/updated_objects/1" }.should route_to(:controller => "updated_objects", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/updated_objects/1/edit" }.should route_to(:controller => "updated_objects", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/updated_objects" }.should route_to(:controller => "updated_objects", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/updated_objects/1" }.should route_to(:controller => "updated_objects", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/updated_objects/1" }.should route_to(:controller => "updated_objects", :action => "destroy", :id => "1")
    end

  end
end
