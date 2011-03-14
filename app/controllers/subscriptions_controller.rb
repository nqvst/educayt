class SubscriptionsController < ApplicationController

  def create
    @followable = Followable.find(params[:followable_id])
    subscribe!(@followable, current_user)
    redirect_to FollowablesHelper.get_object_from_followable(@followable)
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @followable = Followable.find(@subscription.followable_id)

    unsubscribe!(@subscription)
    
    #unknown object can be any object that is followable
    @unknown_object = FollowablesHelper.get_object_from_followable(@followable)
    redirect_to @unknown_object
  end
  
end
