class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :followable

  validates 	:user_id,
              :presence => true
  validates 	:followable_id,
              :presence => true
end
