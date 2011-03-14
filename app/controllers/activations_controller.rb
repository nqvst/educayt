class ActivationsController < ApplicationController
  #This action is proceed when user tries to activate his account
   def activate_account
     if !signed_in?
        @user = User.find(params[:id])
         if !@user.nil? && !@user.activated
            activ_code = (params[:code])
            if @user.correct_activation_code?(activ_code)
              if @user.activate_account?
                  sign_in(@user)
                  flash[:success] = "Hi #{@user.name}, your registration is now complete."
              #redirect_to @user
              else
                flash[:error]= "System error.\n Please try to activate your account again."
            end
          end
        end
     end
      redirect_to root_path
   end

end
