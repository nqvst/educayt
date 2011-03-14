require 'spec_helper'

describe TutorialMediaTypesController do

  def mock_tutorial_media_type(stubs={})
    (@mock_tutorial_media_type ||= mock_model(TutorialMediaType).as_null_object).tap do |tutorial_media_type|
      tutorial_media_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all tutorial_media_types as @tutorial_media_types" do
      TutorialMediaType.stub(:all) { [mock_tutorial_media_type] }
      get :index
      assigns(:tutorial_media_types).should eq([mock_tutorial_media_type])
    end
  end

  describe "GET show" do
    it "assigns the requested tutorial_media_type as @tutorial_media_type" do
      TutorialMediaType.stub(:find).with("37") { mock_tutorial_media_type }
      get :show, :id => "37"
      assigns(:tutorial_media_type).should be(mock_tutorial_media_type)
    end
  end

  describe "GET new" do
    it "assigns a new tutorial_media_type as @tutorial_media_type" do
      TutorialMediaType.stub(:new) { mock_tutorial_media_type }
      get :new
      assigns(:tutorial_media_type).should be(mock_tutorial_media_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested tutorial_media_type as @tutorial_media_type" do
      TutorialMediaType.stub(:find).with("37") { mock_tutorial_media_type }
      get :edit, :id => "37"
      assigns(:tutorial_media_type).should be(mock_tutorial_media_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tutorial_media_type as @tutorial_media_type" do
        TutorialMediaType.stub(:new).with({'these' => 'params'}) { mock_tutorial_media_type(:save => true) }
        post :create, :tutorial_media_type => {'these' => 'params'}
        assigns(:tutorial_media_type).should be(mock_tutorial_media_type)
      end

      it "redirects to the created tutorial_media_type" do
        TutorialMediaType.stub(:new) { mock_tutorial_media_type(:save => true) }
        post :create, :tutorial_media_type => {}
        response.should redirect_to(tutorial_media_type_url(mock_tutorial_media_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tutorial_media_type as @tutorial_media_type" do
        TutorialMediaType.stub(:new).with({'these' => 'params'}) { mock_tutorial_media_type(:save => false) }
        post :create, :tutorial_media_type => {'these' => 'params'}
        assigns(:tutorial_media_type).should be(mock_tutorial_media_type)
      end

      it "re-renders the 'new' template" do
        TutorialMediaType.stub(:new) { mock_tutorial_media_type(:save => false) }
        post :create, :tutorial_media_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tutorial_media_type" do
        TutorialMediaType.should_receive(:find).with("37") { mock_tutorial_media_type }
        mock_tutorial_media_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tutorial_media_type => {'these' => 'params'}
      end

      it "assigns the requested tutorial_media_type as @tutorial_media_type" do
        TutorialMediaType.stub(:find) { mock_tutorial_media_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:tutorial_media_type).should be(mock_tutorial_media_type)
      end

      it "redirects to the tutorial_media_type" do
        TutorialMediaType.stub(:find) { mock_tutorial_media_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(tutorial_media_type_url(mock_tutorial_media_type))
      end
    end

    describe "with invalid params" do
      it "assigns the tutorial_media_type as @tutorial_media_type" do
        TutorialMediaType.stub(:find) { mock_tutorial_media_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:tutorial_media_type).should be(mock_tutorial_media_type)
      end

      it "re-renders the 'edit' template" do
        TutorialMediaType.stub(:find) { mock_tutorial_media_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tutorial_media_type" do
      TutorialMediaType.should_receive(:find).with("37") { mock_tutorial_media_type }
      mock_tutorial_media_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tutorial_media_types list" do
      TutorialMediaType.stub(:find) { mock_tutorial_media_type }
      delete :destroy, :id => "1"
      response.should redirect_to(tutorial_media_types_url)
    end
  end

end
