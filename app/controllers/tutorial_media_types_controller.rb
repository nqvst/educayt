class TutorialMediaTypesController < ApplicationController
  # GET /tutorial_media_types
  # GET /tutorial_media_types.xml
  def index
    @tutorial_media_types = TutorialMediaType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tutorial_media_types }
    end
  end

  # GET /tutorial_media_types/1
  # GET /tutorial_media_types/1.xml
  def show
    @tutorial_media_type = TutorialMediaType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tutorial_media_type }
    end
  end

  # GET /tutorial_media_types/new
  # GET /tutorial_media_types/new.xml
  def new
    @tutorial_media_type = TutorialMediaType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tutorial_media_type }
    end
  end

  # GET /tutorial_media_types/1/edit
  def edit
    @tutorial_media_type = TutorialMediaType.find(params[:id])
  end

  # POST /tutorial_media_types
  # POST /tutorial_media_types.xml
  def create
    @tutorial_media_type = TutorialMediaType.new(params[:tutorial_media_type])

    respond_to do |format|
      if @tutorial_media_type.save
        format.html { redirect_to(@tutorial_media_type, :notice => 'Tutorial media type was successfully created.') }
        format.xml  { render :xml => @tutorial_media_type, :status => :created, :location => @tutorial_media_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tutorial_media_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tutorial_media_types/1
  # PUT /tutorial_media_types/1.xml
  def update
    @tutorial_media_type = TutorialMediaType.find(params[:id])

    respond_to do |format|
      if @tutorial_media_type.update_attributes(params[:tutorial_media_type])
        format.html { redirect_to(@tutorial_media_type, :notice => 'Tutorial media type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tutorial_media_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorial_media_types/1
  # DELETE /tutorial_media_types/1.xml
  def destroy
    @tutorial_media_type = TutorialMediaType.find(params[:id])
    @tutorial_media_type.destroy

    respond_to do |format|
      format.html { redirect_to(tutorial_media_types_url) }
      format.xml  { head :ok }
    end
  end
end
