class TutorialsController < ApplicationController
  def show
    @tutorial = Tutorial.find(params[:id])
    @followable = FollowablesHelper.get_followable(@tutorial)
    @commentable = CommentablesHelper.is_object_commentable?(@tutorial)
  end

  def new
    if !current_user.nil?
      @tutorial = Tutorial.new
      @title = "Create Tutorial"
    else
      deny_access
    end
  end

  def index
    if params[:user_id].nil?
      @tutorials = Tutorial.all
    else
      @tutorials = User.find(params[:user_id]).tutorials
    end
    @tutorials = @tutorials.paginate(:page => params[:page])
  end

  def create
    @tutorial = Tutorial.new(params[:tutorial])
    @tutorial.user = User.find(current_user)
    if @tutorial.save
      flash[:success] = "Tutorial successfully created!"
      redirect_to @tutorial
    else
      @title = "Create Tutorial"
      render 'new'
    end
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
    if current_user == @tutorial.user
      @title = "Edit Tutorial"
    else
      permission_denied(@tutorial)
    end
  end
  
  def update
    @tutorial = Tutorial.find(params[:id])
    if @tutorial.update_attributes(params[:tutorial])
      flash[:success] = "Tutorial updated."

      if params[:tutorial_parts_order] != nil
        parts = params[:tutorial_parts_order].to_s.split(',');
        i = 1;
        parts.each do |id|
          TutorialPart.find(id).update_attributes(:in_order => i)
          i = i + 1
        end
      end
      
      redirect_to @tutorial
    else
      @title = "Edit Tutorial"
      render 'edit'
    end
  end

  def destroy
    @tutorial = Tutorial.find(params[:id])
    if @tutorial.user_id == current_user.id
      @tutorial.delete
      flash[:success] = "Successfully deleted "
      redirect_to current_user
    end
  end

end
