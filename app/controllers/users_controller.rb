class UsersController < ApplicationController
  before_action :auth_admin

  def index
    @users = User.order(id: 'asc')
  end

  def edit_role
    @roles = ['admin', 'user']
  end

  def update_role
    user = User.where(email: params[:email]).first
    if !user
      @roles = ['admin', 'user']
      @error = 'user does not exist'
      render 'edit_role'
    else
      user.update(role: params[:role])
      redirect_to users_path
    end
  end
end