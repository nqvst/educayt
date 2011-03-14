class TutorialPart < ActiveRecord::Base
  attr_accessible :title, :description, :media, :content_text, :in_order, :id

  validates :content_text, :presence => true, :length => { :maximum => 700 }
  validates :tutorial_id, :presence => true
  validates :in_order, :presence => true

  belongs_to :tutorial
  has_one :user, :through => :tutorial
  has_many :tutorial_medias

  default_scope :order => 'tutorial_parts.in_order ASC'

  after_create :notify_save, :commentablize
  after_update :notify_update

  def update_from_child(updated_object, action)
    notify(action, updated_object)
  end

  private

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
    get_parents.each do |p|
      p.update_from_child(updated_object, action)
    end
  end

  def get_parents
    parents = []
    parents << self.tutorial
    return parents
  end

end
