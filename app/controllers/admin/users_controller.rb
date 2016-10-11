class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin
  before_action :load_user, only: :destroy

  def index
    @users = User.newest.paginate page: params[:page], per_page: Settings.per_page
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end
end
