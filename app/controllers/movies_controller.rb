class UserController < ApplicationController

  def user_param
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    
  end

  def index
    
  end

  def new
   
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
   
  end

end
