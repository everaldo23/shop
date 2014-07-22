class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate( params[:session][:password])
      sign_in user
      session[:user_id] = current_user.id
      load_order
      @order.update_attributes(user: user)
      redirect_back_or user
    else
      flash.now[:danger] = "Invalid email/password combination!"
      render 'sessions/new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    session[:order_id] = nil
    sign_out
    redirect_to root_url
  end
end
