class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

 def create_with_provider

      auth = request.env['omniauth.auth']
      email = auth['extra']['user_hash']['email']
      name = auth['user_info']['name']
      uid = auth['uid']

      user = User.find_by_email(email)
      if user
        #då finns usern reggad redan med password!
         sign_in user
         redirect_to user

      else
        redirect_to new_user_path(:name => name, :email => email, :uid => uid, :message => "choose a password to complete the registration.")
      end
 end
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      render 'new'
    elsif !user.activated?
        flash.now[:notice] = "Your account is not activated yet. Check your e-mail for activation link."
        render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
