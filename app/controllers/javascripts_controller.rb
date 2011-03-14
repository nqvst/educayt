class JavascriptsController < ApplicationController
  def dynamic_subcategories
    @subcategories = Subcategory.find(:all)
  end

end
