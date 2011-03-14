require 'spec_helper'

describe TutorialMediasController do

  def mock_tutorial_media(stubs={})
    (@mock_tutorial_media ||= mock_model(TutorialMedia).as_null_object).tap do |tutorial_media|
      tutorial_media.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all tutorial_medias as @tutorial_medias" do
      TutorialMedia.stub(:all) { [mock_tutorial_media] }
      get :index
      assigns(:tutorial_medias).should eq([mock_tutorial_media])
    end
  end

  describe "GET show" do
    it "assigns the requested tutorial_media as @tutorial_media" do
      TutorialMedia.stub(:find).with("37") { mock_tutorial_media }
      get :show, :id => "37"
      assigns(:tutorial_media).should be(mock_tutorial_media)
    end
  end

  describe "GET new" do
    it "assigns a new tutorial_media as @tutorial_media" do
      TutorialMedia.stub(:new) { mock_tutorial_media }
      get :new
      assigns(:tutorial_media).should be(mock_tutorial_media)
    end
  end

  describe "GET edit" do
    it "assigns the requested tutorial_media as @tutorial_media" do
      TutorialMedia.stub(:find).with("37") { mock_tutorial_media }
      get :edit, :id => "37"
      assigns(:tutorial_media).should be(mock_tutorial_media)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tutorial_media as @tutorial_media" do
        TutorialMedia.stub(:new).with({'these' => 'params'}) { mock_tutorial_media(:save => true) }
        post :create, :tutorial_media => {'these' => 'params'}
        assigns(:tutorial_media).should be(mock_tutorial_media)
      end

      it "redirects to the created tutorial_media" do
        TutorialMedia.stub(:new) { mock_tutorial_media(:save => true) }
        post :create, :tutorial_media => {}
        response.should redirect_to(tutorial_media_url(mock_tutorial_media))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tutorial_media as @tutorial_media" do
        TutorialMedia.stub(:new).with({'these' => 'params'}) { mock_tutorial_media(:save => false) }
        post :create, :tutorial_media => {'these' => 'params'}
        assigns(:tutorial_media).should be(mock_tutorial_media)
      end

      it "re-renders the 'new' template" do
        TutorialMedia.stub(:new) { mock_tutorial_media(:save => false) }
        post :create, :tutorial_media => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tutorial_media" do
        TutorialMedia.should_receive(:find).with("37") { mock_tutorial_media }
        mock_tutorial_media.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tutorial_media => {'these' => 'params'}
      end

      it "assigns the requested tutorial_media as @tutorial_media" do
        TutorialMedia.stub(:find) { mock_tutorial_media(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:tutorial_media).should be(mock_tutorial_media)
      end

      it "redirects to the tutorial_media" do
        TutorialMedia.stub(:find) { mock_tutorial_media(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(tutorial_media_url(mock_tutorial_media))
      end
    end

    describe "with invalid params" do
      it "assigns the tutorial_media as @tutorial_media" do
        TutorialMedia.stub(:find) { mock_tutorial_media(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:tutorial_media).should be(mock_tutorial_media)
      end

      it "re-renders the 'edit' template" do
        TutorialMedia.stub(:find) { mock_tutorial_media(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tutorial_media" do
      TutorialMedia.should_receive(:find).with("37") { mock_tutorial_media }
      mock_tutorial_media.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tutorial_medias list" do
      TutorialMedia.stub(:find) { mock_tutorial_media }
      delete :destroy, :id => "1"
      response.should redirect_to(tutorial_medias_url)
    end
  end

end
