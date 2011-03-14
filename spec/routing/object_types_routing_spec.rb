require "spec_helper"

describe ObjectTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/object_types" }.should route_to(:controller => "object_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/object_types/new" }.should route_to(:controller => "object_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/object_types/1" }.should route_to(:controller => "object_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/object_types/1/edit" }.should route_to(:controller => "object_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/object_types" }.should route_to(:controller => "object_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/object_types/1" }.should route_to(:controller => "object_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/object_types/1" }.should route_to(:controller => "object_types", :action => "destroy", :id => "1")
    end

  end
end
