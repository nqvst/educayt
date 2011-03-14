class Tutorial < ActiveRecord::Base
  attr_accessible :description, :name

  validates :description, :presence => true, :length => { :maximum => 255 }
  validates :user_id, :presence => true
  validates :name, :presence => true

  belongs_to :user
  belongs_to :subcategory

  has_many :tutorial_parts, :dependent => :destroy
  has_many :tutorial_part_tests
  
  #Could this be an alternative for category sorting?
  default_scope :order => 'tutorials.created_at DESC'

  after_save   :followablize, :commentablize, :notify_save
  after_update :notify_update

  def update_from_child(updated_object, action)
    notify(action, updated_object)
  end

  private


  def followablize
     FollowablesHelper.make_followable(self)
  end

  def commentablize
     CommentablesHelper.make_commentable(self)
  end

  def notify_save
     notify('created', UpdatedObjectsHelper.create_updated_object_from_object(self))
  end

  def notify_update
    notify('updated', UpdatedObjectsHelper.create_updated_object_from_object(self))
  end

  def notify(action, updated_object)
    followable_object = FollowablesHelper.get_followable(self)
    NotificationsHelper.create_notifications(followable_object, updated_object, action)
    get_parents.each do |p|
      p.update_from_child(updated_object, action)
    end
  end

  def get_parents
    parents = []
    parents << self.user
    unless self.subcategory.nil?
      parents << self.subcategory
    end
    return parents
  end
end
