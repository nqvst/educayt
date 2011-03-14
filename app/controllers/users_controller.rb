class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :authenticate, :except => [:show, :new, :create, :forgot_password]
  def new
  	if params[:message]
  		flash[:notice] = params[:message]
  	end
    @user = User.new
    @title = "Sign up"
  end

  def show
  	user_feed
    @user = User.find(params[:id])
    @followable = FollowablesHelper.get_followable(@user)
    @tutorials = @user.tutorials.paginate(:page => params[:page])
    @title = @user.name
    @tutorials = @user.tutorials 
    Tutorial.find_by_user_id(@user.id)
  end

  def edit
  	
    if current_user
      @user = current_user
      @title = "Edit user"
    else
	    deny_access
    end
  end

  def create
  	if params[:message]
  		flash[:success] = params[:message]
  	end
    @user = User.new(params[:user])

    if(!@user.email)
      @user.email = params[:email]
    end
    if @user.save
      if !@user.facebook_user?
        UserMailer.account_activation_instructions(@user.id).deliver
        flash[:notice] = "You have to activate you account to complete registration. Check your e-mail for instructions."
      else
        @user.activate_account?
        sign_in @user
      end
      redirect_to root_path
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def update
    @user = User.find(current_user)
    text = "Profile updated."
    email_changed = @user.changed_email?(params[:email])

    if @user.update_attributes(params[:user])
#      if email_changed
#        @user.deactivate_account
#
#        sign_out
#        text += "You have to activate your account because of email change."
#      end
      flash[:success] = text
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
    def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
   def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
 
  def forgot_password
   if !current_user
     if request.post?
        unless params[:email].blank?
          user = User.find_by_email(params[:email])
          respond_to do |format|
            if user
              user.forgot_password!
              format.html {
                flash[:success] = "A new password has been sent to you. Please check your email."
                redirect_to signin_path
              }
              format.js { render :text => "A new password has been sent to you. Please check your email." }
            else
              format.html {
                flash[:warning] = "We could not find a user with that email address."
                redirect_to signin_path
              }
              format.js { render :text => "We could not find a user with that email address.", :status => 500 }
            end
          end
        end
      end
   else
     redirect_back_or current_user
   end
  end
  private

  def authenticate
    deny_access unless signed_in?
end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end


 end
