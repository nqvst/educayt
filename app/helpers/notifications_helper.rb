module NotificationsHelper

  def self.create_notifications(followable, updated_object, action)
    create_notifications_for_subscribers(followable, updated_object, action)
  end

  private
  def self.create_notifications_for_subscribers(followable, updated_object, action)
    followable.users.each do |u|
      n = Notification.new({:user_id => u.id,
                            :followable_id => followable.id,
                            :updated_object_id => updated_object.id,
                            :action => action,
                            :viewed => false
                           })
      n.save
    end
  end
  
end
