class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new
    @comment.message = params[:comment][:message]
    @comment.commentable_id = params[:commentable_id]
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        @commentable = CommentablesHelper.get_object_from_commentable_id(@comment.commentable_id)
        format.html { redirect_to(@commentable, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.deleted = true

    respond_to do |format|
      format.html { redirect_to(CommentablesHelper.get_object_from_commentable(@comment.commentable)) }
      format.xml  { head :ok }
    end
  end
end
