class TutorialPartsController < ApplicationController
  def show
    @tutorial_part = TutorialPart.find(params[:id])
  end

  def index
    if params[:tutorial_id].nil?
      @tutorial_parts = TutorialPart.all
    else
      @tutorial_parts = Tutorial.find(params[:tutorial_id]).tutorial_parts
    end
      @tutorial_parts = @tutorial_parts.paginate(:page => params[:page])
  end

  def create
    @tutorial_part = TutorialPart.new(params[:tutorial_part])    
    @tutorial_part.tutorial_id = Tutorial.find(params[:tutorial_id]).id

    if @tutorial_part.save!
      update_tutorial_media_from_params(params)
      
      flash[:success] = "Part successfully created!"
      redirect_to @tutorial_part
    else
      flash[:error] = "Not created"
      @title = "Create Tutorial part"
      render 'new'
    end
  end

  def new
    @tutorial_part = TutorialPart.new
    @title = "Create Tutorial Part"
  end

  def edit
    @tutorial_part = TutorialPart.find(params[:id])
    if(current_user != @tutorial_part.user)
      deny_access
    end
  end

  def update
    @tutorial_part = TutorialPart.find(params[:id])
    if(current_user != @tutorial_part.user)
      deny_access
    else   
      if @tutorial_part.update_attributes(params[:tutorial_part])
        update_tutorial_media_from_params(params)
        flash[:success] = "Part updated."
        redirect_to @tutorial_part
      else
        @title = "Edit tutorial part"
        render 'edit'
      end
    end
  end

  def destroy
    @tutorial_part = TutorialPart.find(params[:id])
    if @tutorial_part.user == current_user
      @tutorial_part.delete
      flash[:success] = "Successfully deleted "
      redirect_to @tutorial_part.tutorial
    end
  end

 private

 def update_tutorial_media_from_params(params)
      i = 1
      while params["field" + i.to_s] != nil
        begin
            @tutorial_media = TutorialMedia.find_by_id(Integer(params["tutorial_media_id_" + i.to_s]))
            @tutorial_media.update_attributes({:url => params["field" + i.to_s],
                             :description => params["description" + i.to_s]})
        rescue
            TutorialMedia.create({:tutorial_part_id => @tutorial_part.id,
                             :url => params["field" + i.to_s],
                             :description => params["description" + i.to_s]})
        end
        i = i + 1;
      end
 end
end