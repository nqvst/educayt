require "spec_helper"

describe TutorialMediasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tutorial_medias" }.should route_to(:controller => "tutorial_medias", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tutorial_medias/new" }.should route_to(:controller => "tutorial_medias", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tutorial_medias/1" }.should route_to(:controller => "tutorial_medias", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tutorial_medias/1/edit" }.should route_to(:controller => "tutorial_medias", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tutorial_medias" }.should route_to(:controller => "tutorial_medias", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tutorial_medias/1" }.should route_to(:controller => "tutorial_medias", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tutorial_medias/1" }.should route_to(:controller => "tutorial_medias", :action => "destroy", :id => "1")
    end

  end
end
