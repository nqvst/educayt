require 'spec_helper'

describe CommentablesController do

  def mock_commentable(stubs={})
    (@mock_commentable ||= mock_model(Commentable).as_null_object).tap do |commentable|
      commentable.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all commentables as @commentables" do
      Commentable.stub(:all) { [mock_commentable] }
      get :index
      assigns(:commentables).should eq([mock_commentable])
    end
  end

  describe "GET show" do
    it "assigns the requested commentable as @commentable" do
      Commentable.stub(:find).with("37") { mock_commentable }
      get :show, :id => "37"
      assigns(:commentable).should be(mock_commentable)
    end
  end

  describe "GET new" do
    it "assigns a new commentable as @commentable" do
      Commentable.stub(:new) { mock_commentable }
      get :new
      assigns(:commentable).should be(mock_commentable)
    end
  end

  describe "GET edit" do
    it "assigns the requested commentable as @commentable" do
      Commentable.stub(:find).with("37") { mock_commentable }
      get :edit, :id => "37"
      assigns(:commentable).should be(mock_commentable)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created commentable as @commentable" do
        Commentable.stub(:new).with({'these' => 'params'}) { mock_commentable(:save => true) }
        post :create, :commentable => {'these' => 'params'}
        assigns(:commentable).should be(mock_commentable)
      end

      it "redirects to the created commentable" do
        Commentable.stub(:new) { mock_commentable(:save => true) }
        post :create, :commentable => {}
        response.should redirect_to(commentable_url(mock_commentable))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved commentable as @commentable" do
        Commentable.stub(:new).with({'these' => 'params'}) { mock_commentable(:save => false) }
        post :create, :commentable => {'these' => 'params'}
        assigns(:commentable).should be(mock_commentable)
      end

      it "re-renders the 'new' template" do
        Commentable.stub(:new) { mock_commentable(:save => false) }
        post :create, :commentable => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested commentable" do
        Commentable.should_receive(:find).with("37") { mock_commentable }
        mock_commentable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :commentable => {'these' => 'params'}
      end

      it "assigns the requested commentable as @commentable" do
        Commentable.stub(:find) { mock_commentable(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:commentable).should be(mock_commentable)
      end

      it "redirects to the commentable" do
        Commentable.stub(:find) { mock_commentable(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(commentable_url(mock_commentable))
      end
    end

    describe "with invalid params" do
      it "assigns the commentable as @commentable" do
        Commentable.stub(:find) { mock_commentable(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:commentable).should be(mock_commentable)
      end

      it "re-renders the 'edit' template" do
        Commentable.stub(:find) { mock_commentable(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested commentable" do
      Commentable.should_receive(:find).with("37") { mock_commentable }
      mock_commentable.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the commentables list" do
      Commentable.stub(:find) { mock_commentable }
      delete :destroy, :id => "1"
      response.should redirect_to(commentables_url)
    end
  end

end
