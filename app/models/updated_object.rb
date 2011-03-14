class UpdatedObject < ActiveRecord::Base
  belongs_to :object_type
  has_many :notifications
  
end
