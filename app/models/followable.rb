class Followable < ActiveRecord::Base
  attr_accessible :local_type, :local_id

  has_many :subscriptions
  has_many :users, :through => :subscriptions
  has_many :notifications

  validates :local_id, :presence => true
  validates :local_type, :presence => true
end
