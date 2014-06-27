class SessionsController < ApplicationController
  
  def _header
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate( params[:session][:password])
      #Code to redirect user to show page when successful
    else
      flash.now[:error] = "Invalid email/password combination!"
      render 'static_pages/home'
    end
  end
  
  def destroy
  end
end
