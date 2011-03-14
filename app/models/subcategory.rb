class Subcategory < ActiveRecord::Base
  belongs_to :category
  validates :category_id, :presence => true
  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false } 
end