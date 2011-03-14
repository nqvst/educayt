include Kernel
module FollowablesHelper
  def self.make_followable(object)
    if Followable.find_by_local_id_and_local_type(object.id, object.class.name.to_s).nil?
      f = Followable.new({:local_type => object.class.name.to_s, :local_id => object.id})
      f.save
    end
  end
#gets folowable object from object
  def self.get_followable(object)
    Followable.find_by_local_id_and_local_type(object.id, object.class.name.to_s)
  end

  def self.get_object_from_followable(followable)
     Kernel.const_get(followable.local_type).find_by_id(followable.local_id)
  end
  
end
