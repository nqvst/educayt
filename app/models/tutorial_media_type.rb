class TutorialMediaType < ActiveRecord::Base
  validates :media_type, :presence => true

  has_many :tutorial_parts
end
