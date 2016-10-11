class UsersController < ApplicationController
  before_action :load_user, only: :show

  def index
    @users = User.newest.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
    @results = @user.results.correct_anwsers
    @user_lessons = @user.lessons
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "welcome"
      redirect_to @user
    else
      flash[:danger] = t "error_massages"
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password
  end
end
