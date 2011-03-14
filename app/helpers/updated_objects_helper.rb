module UpdatedObjectsHelper

  def self.create_updated_object_from_object(object_)
    o = UpdatedObject.new()
    ot = ObjectType.find_by_type_name(object_.class.name.to_s)
    if ot == nil
      ot = ObjectType.new()
      ot.type_name = object_.class.name.to_s
      ot.save
    end
    o.object_type = ot
    o.local_id = object_.id
    o.save
    return o
  end

  def self.get_object_from_updated_object(object_)
     Kernel.const_get(object_.local_type).find_by_id(object_.local_id)
  end
  
end
