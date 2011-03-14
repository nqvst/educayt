class TutorialMediasController < ApplicationController
  # GET /tutorial_medias
  # GET /tutorial_medias.xml
  def index
    @tutorial_medias = TutorialMedia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tutorial_medias }
    end
  end

  # GET /tutorial_medias/1
  # GET /tutorial_medias/1.xml
  def show
    @tutorial_media = TutorialMedia.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tutorial_media }
    end
  end

  # GET /tutorial_medias/new
  # GET /tutorial_medias/new.xml
  def new
    @tutorial_media = TutorialMedia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tutorial_media }
    end
  end

  # GET /tutorial_medias/1/edit
  def edit
    @tutorial_media = TutorialMedia.find(params[:id])
  end

  # POST /tutorial_medias
  # POST /tutorial_medias.xml
  def create
    @tutorial_media = TutorialMedia.new(params[:tutorial_media])

    respond_to do |format|
      if @tutorial_media.save
        format.html { redirect_to(@tutorial_media, :notice => 'Tutorial media was successfully created.') }
        format.xml  { render :xml => @tutorial_media, :status => :created, :location => @tutorial_media }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tutorial_media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tutorial_medias/1
  # PUT /tutorial_medias/1.xml
  def update
    @tutorial_media = TutorialMedia.find(params[:id])

    respond_to do |format|
      if @tutorial_media.update_attributes(params[:tutorial_media])
        format.html { redirect_to(@tutorial_media, :notice => 'Tutorial media was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tutorial_media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorial_medias/1
  # DELETE /tutorial_medias/1.xml
  def destroy
    @tutorial_media = TutorialMedia.find(params[:id])
    if(@tutorial_media.tutorial_part.user == current_user)
      @tutorial_media.destroy
      redirect_to @tutorial_media.tutorial_part
    else
      deny_access
    end
  end
end
