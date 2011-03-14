class UpdatedObjectsController < ApplicationController
  # GET /updated_objects
  # GET /updated_objects.xml
  def index
    @updated_objects = UpdatedObject.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @updated_objects }
    end
  end

  # GET /updated_objects/1
  # GET /updated_objects/1.xml
  def show
    @updated_object = UpdatedObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @updated_object }
    end
  end

  # GET /updated_objects/new
  # GET /updated_objects/new.xml
  def new
    @updated_object = UpdatedObject.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @updated_object }
    end
  end

  # GET /updated_objects/1/edit
  def edit
    @updated_object = UpdatedObject.find(params[:id])
  end

  # POST /updated_objects
  # POST /updated_objects.xml
  def create
    @updated_object = UpdatedObject.new(params[:updated_object])

    respond_to do |format|
      if @updated_object.save
        format.html { redirect_to(@updated_object, :notice => 'Updated object was successfully created.') }
        format.xml  { render :xml => @updated_object, :status => :created, :location => @updated_object }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @updated_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /updated_objects/1
  # PUT /updated_objects/1.xml
  def update
    @updated_object = UpdatedObject.find(params[:id])

    respond_to do |format|
      if @updated_object.update_attributes(params[:updated_object])
        format.html { redirect_to(@updated_object, :notice => 'Updated object was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @updated_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /updated_objects/1
  # DELETE /updated_objects/1.xml
  def destroy
    @updated_object = UpdatedObject.find(params[:id])
    @updated_object.destroy

    respond_to do |format|
      format.html { redirect_to(updated_objects_url) }
      format.xml  { head :ok }
    end
  end
end
