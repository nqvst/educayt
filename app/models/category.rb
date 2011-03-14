class Category < ActiveRecord::Base
  has_many :subcategories
  has_many :tutorials
  has_one :color
  
  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }
end

