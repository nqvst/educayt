class SubcategoriesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new
    @title = "Create subcategory"
  end

  def create
   @category= Category.find(params[:category_id])

    @subcategory = Subcategory.new(params[:subcategory])
    @subcategory.category_id = @category.id
    if @subcategory.save
      flash[:success] = "Subcategory " + @subcategory.name +  " was successfully created!"
      redirect_to categories_path
    else
      flash[:error] = "Couldn't save a subcategory"
      redirect_to new_subcategory_path(:category_id => @category.id)
     end
  end

  def update
  end

  def delete
  end
  def  index
    @subcategories = Subcategory.all
  end
  
  def show
    @subcategory = Subcategory.find(params[:id])
    @tutorials = Tutorial.where(:subcategory_id => params[:id])  
    @tutorials = @tutorials.paginate(:page => params[:page])
    #Tutorial.find_by_subcategory_id(@subcategory.id) 
  end
  
end