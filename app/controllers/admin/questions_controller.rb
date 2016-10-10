class Admin::QuestionsController < ApplicationController
  before_action :load_question, only: [:edit, :update]
  before_action :load_category, only: [:index, :edit, :update]

  def index
    @category = Category.find_by id: params[:category_id]
    @questions = @category.questions.search_name(params[:search]).newest.paginate page: params[:page], per_page: Settings.per_page
  end

  def edit
  end

  def update
    if @question.update_attributes user_params
      flash[:success] = "abc"
      redirect_to @user
    else
      render :edit
    end
  end
  private
  def load_question
    @question = Question.find_by id: params[:id]
    unless @question
      flash[:danger] = t "admin.question.question_not_found"
      redirect_to admin_root_path
    end
  end

  def load_category
    @category = Category.find_by id: params[:category_id]
    unless @category
      flash[:danger] = t "admin.category.category_not_found"
      redirect_to admin_root_path
    end
  end
end
