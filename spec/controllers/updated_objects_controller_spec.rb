require 'spec_helper'

describe UpdatedObjectsController do

  def mock_updated_object(stubs={})
    (@mock_updated_object ||= mock_model(UpdatedObject).as_null_object).tap do |updated_object|
      updated_object.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all updated_objects as @updated_objects" do
      UpdatedObject.stub(:all) { [mock_updated_object] }
      get :index
      assigns(:updated_objects).should eq([mock_updated_object])
    end
  end

  describe "GET show" do
    it "assigns the requested updated_object as @updated_object" do
      UpdatedObject.stub(:find).with("37") { mock_updated_object }
      get :show, :id => "37"
      assigns(:updated_object).should be(mock_updated_object)
    end
  end

  describe "GET new" do
    it "assigns a new updated_object as @updated_object" do
      UpdatedObject.stub(:new) { mock_updated_object }
      get :new
      assigns(:updated_object).should be(mock_updated_object)
    end
  end

  describe "GET edit" do
    it "assigns the requested updated_object as @updated_object" do
      UpdatedObject.stub(:find).with("37") { mock_updated_object }
      get :edit, :id => "37"
      assigns(:updated_object).should be(mock_updated_object)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created updated_object as @updated_object" do
        UpdatedObject.stub(:new).with({'these' => 'params'}) { mock_updated_object(:save => true) }
        post :create, :updated_object => {'these' => 'params'}
        assigns(:updated_object).should be(mock_updated_object)
      end

      it "redirects to the created updated_object" do
        UpdatedObject.stub(:new) { mock_updated_object(:save => true) }
        post :create, :updated_object => {}
        response.should redirect_to(updated_object_url(mock_updated_object))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved updated_object as @updated_object" do
        UpdatedObject.stub(:new).with({'these' => 'params'}) { mock_updated_object(:save => false) }
        post :create, :updated_object => {'these' => 'params'}
        assigns(:updated_object).should be(mock_updated_object)
      end

      it "re-renders the 'new' template" do
        UpdatedObject.stub(:new) { mock_updated_object(:save => false) }
        post :create, :updated_object => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested updated_object" do
        UpdatedObject.should_receive(:find).with("37") { mock_updated_object }
        mock_updated_object.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :updated_object => {'these' => 'params'}
      end

      it "assigns the requested updated_object as @updated_object" do
        UpdatedObject.stub(:find) { mock_updated_object(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:updated_object).should be(mock_updated_object)
      end

      it "redirects to the updated_object" do
        UpdatedObject.stub(:find) { mock_updated_object(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(updated_object_url(mock_updated_object))
      end
    end

    describe "with invalid params" do
      it "assigns the updated_object as @updated_object" do
        UpdatedObject.stub(:find) { mock_updated_object(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:updated_object).should be(mock_updated_object)
      end

      it "re-renders the 'edit' template" do
        UpdatedObject.stub(:find) { mock_updated_object(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested updated_object" do
      UpdatedObject.should_receive(:find).with("37") { mock_updated_object }
      mock_updated_object.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the updated_objects list" do
      UpdatedObject.stub(:find) { mock_updated_object }
      delete :destroy, :id => "1"
      response.should redirect_to(updated_objects_url)
    end
  end

end
