class UsersController < ApplicationController
  before_action :load_user, only: :show

  def index
    @users = User.newest.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
    @count_word = Result.count_correct_answer @user
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
    params.require(:user).permit(:name, :email, :password)
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "signup_first"
      redirect_to root_path
    end
  end
end
