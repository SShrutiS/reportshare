class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :get_user
  
  private
  # in ruby the private methis cann be access by the deverievd class
  #add authentication
  
  def get_user
      @user = current_user
      @is_logged_in = user_signed_in? #true fals
      @is_user = @is_logged_in && @user.role =='user'
      @is_admin = @is_logged_in && @user.role =='admin'
  end
  
  def auth_admin
      redirect_to root_url if !@is_admin
      
  end
  
  def auth_user
      redirect_to root_url if !@is_user
  end  
end
