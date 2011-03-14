require 'spec_helper'

describe TutorialPartTestsController do

  def mock_tutorial_part_test(stubs={})
    (@mock_tutorial_part_test ||= mock_model(TutorialPartTest).as_null_object).tap do |tutorial_part_test|
      tutorial_part_test.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all tutorial_part_tests as @tutorial_part_tests" do
      TutorialPartTest.stub(:all) { [mock_tutorial_part_test] }
      get :index
      assigns(:tutorial_part_tests).should eq([mock_tutorial_part_test])
    end
  end

  describe "GET show" do
    it "assigns the requested tutorial_part_test as @tutorial_part_test" do
      TutorialPartTest.stub(:find).with("37") { mock_tutorial_part_test }
      get :show, :id => "37"
      assigns(:tutorial_part_test).should be(mock_tutorial_part_test)
    end
  end

  describe "GET new" do
    it "assigns a new tutorial_part_test as @tutorial_part_test" do
      TutorialPartTest.stub(:new) { mock_tutorial_part_test }
      get :new
      assigns(:tutorial_part_test).should be(mock_tutorial_part_test)
    end
  end

  describe "GET edit" do
    it "assigns the requested tutorial_part_test as @tutorial_part_test" do
      TutorialPartTest.stub(:find).with("37") { mock_tutorial_part_test }
      get :edit, :id => "37"
      assigns(:tutorial_part_test).should be(mock_tutorial_part_test)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tutorial_part_test as @tutorial_part_test" do
        TutorialPartTest.stub(:new).with({'these' => 'params'}) { mock_tutorial_part_test(:save => true) }
        post :create, :tutorial_part_test => {'these' => 'params'}
        assigns(:tutorial_part_test).should be(mock_tutorial_part_test)
      end

      it "redirects to the created tutorial_part_test" do
        TutorialPartTest.stub(:new) { mock_tutorial_part_test(:save => true) }
        post :create, :tutorial_part_test => {}
        response.should redirect_to(tutorial_part_test_url(mock_tutorial_part_test))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tutorial_part_test as @tutorial_part_test" do
        TutorialPartTest.stub(:new).with({'these' => 'params'}) { mock_tutorial_part_test(:save => false) }
        post :create, :tutorial_part_test => {'these' => 'params'}
        assigns(:tutorial_part_test).should be(mock_tutorial_part_test)
      end

      it "re-renders the 'new' template" do
        TutorialPartTest.stub(:new) { mock_tutorial_part_test(:save => false) }
        post :create, :tutorial_part_test => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tutorial_part_test" do
        TutorialPartTest.should_receive(:find).with("37") { mock_tutorial_part_test }
        mock_tutorial_part_test.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tutorial_part_test => {'these' => 'params'}
      end

      it "assigns the requested tutorial_part_test as @tutorial_part_test" do
        TutorialPartTest.stub(:find) { mock_tutorial_part_test(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:tutorial_part_test).should be(mock_tutorial_part_test)
      end

      it "redirects to the tutorial_part_test" do
        TutorialPartTest.stub(:find) { mock_tutorial_part_test(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(tutorial_part_test_url(mock_tutorial_part_test))
      end
    end

    describe "with invalid params" do
      it "assigns the tutorial_part_test as @tutorial_part_test" do
        TutorialPartTest.stub(:find) { mock_tutorial_part_test(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:tutorial_part_test).should be(mock_tutorial_part_test)
      end

      it "re-renders the 'edit' template" do
        TutorialPartTest.stub(:find) { mock_tutorial_part_test(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tutorial_part_test" do
      TutorialPartTest.should_receive(:find).with("37") { mock_tutorial_part_test }
      mock_tutorial_part_test.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tutorial_part_tests list" do
      TutorialPartTest.stub(:find) { mock_tutorial_part_test }
      delete :destroy, :id => "1"
      response.should redirect_to(tutorial_part_tests_url)
    end
  end

end
