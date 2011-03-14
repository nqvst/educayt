require "spec_helper"

describe CommentablesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/commentables" }.should route_to(:controller => "commentables", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/commentables/new" }.should route_to(:controller => "commentables", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/commentables/1" }.should route_to(:controller => "commentables", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/commentables/1/edit" }.should route_to(:controller => "commentables", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/commentables" }.should route_to(:controller => "commentables", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/commentables/1" }.should route_to(:controller => "commentables", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/commentables/1" }.should route_to(:controller => "commentables", :action => "destroy", :id => "1")
    end

  end
end
