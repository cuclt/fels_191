class ResultsController < ApplicationController
  def index
  end

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "user_empty"
      redirect_to root_path
    end
    @results = @user.results.correct_anwsers.paginate page: params[:page],
      per_page: Settings.per_page
  end
end
