class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def load_order
    @order = Order.find_or_initialize_by_id(session[:order_id], status: "Unsubmitted", user_id: current_user.id)
    if @order.new_record?
      @order.save!
      session[:order_id] = @order.id
      session[:user_id] = current_user.id
    end
  end
  
end
