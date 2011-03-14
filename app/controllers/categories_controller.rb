  class CategoriesController < ApplicationController
    def new
      @category = Category.new
      @title = "Create new category"
    end
    def create 
      @category = Category.new(params[:category])
      @category.save!
      flash[:success] = "Category" + @category.name +  " was successfully created!"
      redirect_to categories_path
    end
    def destroy
      
    end
 #   def show
  #    @category = Category.find(params[:id])
   # end
    def index
      @categories = Category.all
    end
  end
