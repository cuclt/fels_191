class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

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

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "profile_updated"
      redirect_to @user
    else
      render :edit
    end
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

  def correct_user
    @user = User.find_by id: params[:id]
    unless @user.is_user? current_user
      flash[:danger] = t "signup_first"
      redirect_to root_url
    end
  end
end
