class Comment < ActiveRecord::Base

  attr_accessible :is_deleted

  belongs_to :commentable
  belongs_to :user

  after_create :notify_create
  before_save :set_default_values

  def set_default_values
    self.is_deleted = false
    #has to be here, otherwise save is not happy
    return true
  end
  
  private
  def notify_create
    notify_parents('posted', 
      UpdatedObjectsHelper.create_updated_object_from_object(
        CommentablesHelper.get_object_from_commentable(self.commentable)))
  end
  
  def notify_parents(action, updated_object)
    get_parents.each do |p|
      p.update_from_child(updated_object, action)
    end
  end

  def get_parents
    parents = []
    parents << CommentablesHelper.get_object_from_commentable(self.commentable)
    return parents
  end
  
end
