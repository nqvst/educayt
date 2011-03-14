class Commentable < ActiveRecord::Base
  has_many :comments
  belongs_to :object_type

  validates :deleted, :presence => true

  def get_visible_comments
    Comment.find_all_by_commentable_id_and_is_deleted(self.id, false)
  end

end
