class Admin::UsersController < ApplicationController
  before_action :load_user, only: :destroy

  def index
    @users = User.newest.paginate page: params[:page], per_page: Settings.per_page
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "admin.user.user_not_found"
      redirect_to admin_root_path
    end
  end
end
