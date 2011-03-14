class PagesController < ApplicationController
  
  def home
    @title = "Home"
    if signed_in?
      #redirect_to current_user
      user_feed #gets a feed and stores it in the @feed variable
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

end
