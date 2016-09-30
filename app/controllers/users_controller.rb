class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id,:email)
    
  end

  def new
    # default: render 'new' template
  end

  def create
   begin
    @user = User.create_user!(user_params)
    @validUser = true
    rescue ActiveRecord::RecordInvalid => e
    if e.message == 'Validation failed: User has already been taken'
       flash[:notice] = "Sorry, this user-id is taken. Try again."
       @validUser = false
       redirect_to new_user_path
       return
    end
   
   end
   if(@validUser)
    flash[:notice] = "Welcome #{@user.user_id}. Your account has been created"
   end
    redirect_to login_path
  end

end
