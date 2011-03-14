class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :followable
  belongs_to :updated_object

  
end
