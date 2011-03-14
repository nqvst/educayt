class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  include FollowablesHelper
  include SubscriptionsHelper
end
