class TutorialMedia < ActiveRecord::Base
  
  has_one :tutorial_part
  belongs_to :tutorial_part
  has_one :tutorial_media_type
  has_one :tutorial, :through => :tutorial_part


  before_save :convert_url
  
  private

  def convert_url
    if self.url.end_with?(".jpg") || self.url.end_with?(".png") || self.url.end_with?(".bmp")
      self.tutorial_media_type_id = 2
    else
      self.url = get_video_tag
      self.tutorial_media_type_id = 1
    end
  end

  def get_video_tag
    resource = OEmbed::Providers::Youtube.get(self.url)
    resource.html
  end
end
