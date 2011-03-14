require "spec_helper"

describe TutorialPartTestsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tutorial_part_tests" }.should route_to(:controller => "tutorial_part_tests", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tutorial_part_tests/new" }.should route_to(:controller => "tutorial_part_tests", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tutorial_part_tests/1" }.should route_to(:controller => "tutorial_part_tests", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tutorial_part_tests/1/edit" }.should route_to(:controller => "tutorial_part_tests", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tutorial_part_tests" }.should route_to(:controller => "tutorial_part_tests", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tutorial_part_tests/1" }.should route_to(:controller => "tutorial_part_tests", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tutorial_part_tests/1" }.should route_to(:controller => "tutorial_part_tests", :action => "destroy", :id => "1")
    end

  end
end
