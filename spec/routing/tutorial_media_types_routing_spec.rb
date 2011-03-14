require "spec_helper"

describe TutorialMediaTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tutorial_media_types" }.should route_to(:controller => "tutorial_media_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tutorial_media_types/new" }.should route_to(:controller => "tutorial_media_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tutorial_media_types/1" }.should route_to(:controller => "tutorial_media_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tutorial_media_types/1/edit" }.should route_to(:controller => "tutorial_media_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tutorial_media_types" }.should route_to(:controller => "tutorial_media_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tutorial_media_types/1" }.should route_to(:controller => "tutorial_media_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tutorial_media_types/1" }.should route_to(:controller => "tutorial_media_types", :action => "destroy", :id => "1")
    end

  end
end
