require 'spec_helper'

describe ObjectTypesController do

  def mock_object_type(stubs={})
    (@mock_object_type ||= mock_model(ObjectType).as_null_object).tap do |object_type|
      object_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all object_types as @object_types" do
      ObjectType.stub(:all) { [mock_object_type] }
      get :index
      assigns(:object_types).should eq([mock_object_type])
    end
  end

  describe "GET show" do
    it "assigns the requested object_type as @object_type" do
      ObjectType.stub(:find).with("37") { mock_object_type }
      get :show, :id => "37"
      assigns(:object_type).should be(mock_object_type)
    end
  end

  describe "GET new" do
    it "assigns a new object_type as @object_type" do
      ObjectType.stub(:new) { mock_object_type }
      get :new
      assigns(:object_type).should be(mock_object_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested object_type as @object_type" do
      ObjectType.stub(:find).with("37") { mock_object_type }
      get :edit, :id => "37"
      assigns(:object_type).should be(mock_object_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created object_type as @object_type" do
        ObjectType.stub(:new).with({'these' => 'params'}) { mock_object_type(:save => true) }
        post :create, :object_type => {'these' => 'params'}
        assigns(:object_type).should be(mock_object_type)
      end

      it "redirects to the created object_type" do
        ObjectType.stub(:new) { mock_object_type(:save => true) }
        post :create, :object_type => {}
        response.should redirect_to(object_type_url(mock_object_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved object_type as @object_type" do
        ObjectType.stub(:new).with({'these' => 'params'}) { mock_object_type(:save => false) }
        post :create, :object_type => {'these' => 'params'}
        assigns(:object_type).should be(mock_object_type)
      end

      it "re-renders the 'new' template" do
        ObjectType.stub(:new) { mock_object_type(:save => false) }
        post :create, :object_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested object_type" do
        ObjectType.should_receive(:find).with("37") { mock_object_type }
        mock_object_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :object_type => {'these' => 'params'}
      end

      it "assigns the requested object_type as @object_type" do
        ObjectType.stub(:find) { mock_object_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:object_type).should be(mock_object_type)
      end

      it "redirects to the object_type" do
        ObjectType.stub(:find) { mock_object_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(object_type_url(mock_object_type))
      end
    end

    describe "with invalid params" do
      it "assigns the object_type as @object_type" do
        ObjectType.stub(:find) { mock_object_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:object_type).should be(mock_object_type)
      end

      it "re-renders the 'edit' template" do
        ObjectType.stub(:find) { mock_object_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested object_type" do
      ObjectType.should_receive(:find).with("37") { mock_object_type }
      mock_object_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the object_types list" do
      ObjectType.stub(:find) { mock_object_type }
      delete :destroy, :id => "1"
      response.should redirect_to(object_types_url)
    end
  end

end
