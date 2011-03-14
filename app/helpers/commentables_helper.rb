module CommentablesHelper
  
  def self.make_object_commentable(object_)
    if is_object_commentable?(object_).nil?
      c = Commentable.new({:object_type_id => get_object_type_id(object_), :local_id => object_.id})
      c.save
    end
  end

  def self.is_object_commentable?(object_)
    Commentable.find_by_object_type_id_and_local_id(get_object_type_id(object_), object_.id)
  end

  def self.get_object_from_commentable(object_)
      Kernel.const_get(object_.object_type.type_name).find_by_id(object_.local_id)
  end

  def self.get_object_from_commentable_id(id)
    get_object_from_commentable(Commentable.find_by_id(id))
  end

  private

  def self.get_object_type_id(object_)
      ObjectType.find_by_type_name(object_.class.name.to_s).id
  end
  
end
