class SessionsController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id,:email)
    
  end

  def new
    # default: render 'new' template
  end

  def create
   print "Inside Login"
    u =  User.find_by_user_id(params[:user][:user_id])
    print("Value of U is  #{u}")
   if u != nil
     if u.email == params[:user][:email]
       #flash[:notice] = "You are Logged in as #{u.user_id}"
       session[:session_token] = u.session_token
       redirect_to movies_path
       return
   else
        flash[:notice] = "Invalid user-id/e-mail combination."
        redirect_to login_path
        return
        
     end
   else
      flash[:notice] = "Invalid user-id/e-mail combination."
      redirect_to login_path
   end
  end

 def destroy
    session.clear
    redirect_to movies_path
 end

end
