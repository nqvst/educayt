module SubscriptionsHelper
  def subscribing?(followable, user)
    Subscription.find_by_followable_id_and_user_id(followable.id, user.id)
  end

  def subscribe!(followable, user)
    if Subscription.find_by_followable_id_and_user_id(followable.id, user.id) == nil
      s = Subscription.new({:followable_id => followable.id, :user_id => user.id})
      s.save
    end
  end

  def unsubscribe!(subscription)
    Subscription.find(subscription).destroy
  end
end
