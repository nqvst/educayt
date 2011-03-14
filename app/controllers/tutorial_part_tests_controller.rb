class TutorialPartTestsController < ApplicationController
  # GET /tutorial_part_tests
  # GET /tutorial_part_tests.xml
  def index
    @tutorial_part_tests = TutorialPartTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tutorial_part_tests }
    end
  end

  # GET /tutorial_part_tests/1
  # GET /tutorial_part_tests/1.xml
  def show
    @tutorial_part_test = TutorialPartTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tutorial_part_test }
    end
  end

  # GET /tutorial_part_tests/new
  # GET /tutorial_part_tests/new.xml
  def new
    @tutorial_part_test = TutorialPartTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tutorial_part_test }
    end
  end

  # GET /tutorial_part_tests/1/edit
  def edit
    @tutorial_part_test = TutorialPartTest.find(params[:id])
  end

  # POST /tutorial_part_tests
  # POST /tutorial_part_tests.xml
  def create
    @tutorial_part_test = TutorialPartTest.new(params[:tutorial_part_test])

    respond_to do |format|
      if @tutorial_part_test.save
        format.html { redirect_to(@tutorial_part_test, :notice => 'Tutorial part test was successfully created.') }
        format.xml  { render :xml => @tutorial_part_test, :status => :created, :location => @tutorial_part_test }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tutorial_part_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tutorial_part_tests/1
  # PUT /tutorial_part_tests/1.xml
  def update
    @tutorial_part_test = TutorialPartTest.find(params[:id])

    respond_to do |format|
      if @tutorial_part_test.update_attributes(params[:tutorial_part_test])
        format.html { redirect_to(@tutorial_part_test, :notice => 'Tutorial part test was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tutorial_part_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorial_part_tests/1
  # DELETE /tutorial_part_tests/1.xml
  def destroy
    @tutorial_part_test = TutorialPartTest.find(params[:id])
    @tutorial_part_test.destroy

    respond_to do |format|
      format.html { redirect_to(tutorial_part_tests_url) }
      format.xml  { head :ok }
    end
  end
end
