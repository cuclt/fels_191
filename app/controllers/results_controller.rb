class ResultsController < ApplicationController
  def index
  end

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "user_empty"
      redirect_to root_path
    end
    @category = Category.new
    @results = @user.results.correct_anwsers.search(params[:search]).paginate page: params[:page],
      per_page: Settings.per_page
    @lessons = @user.lessons.includes(:category).filter
  end

  def filter_category
    @results = current_user.results.lessons.where(:category_id, params[:category_id])
    respond_to do |format|
      format.js
    end
  end
end
