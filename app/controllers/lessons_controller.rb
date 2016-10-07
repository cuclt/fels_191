class LessonsController < ApplicationController
  before_action :logged_in_user, except: [:new, :index, :destroy]
  before_action :load_lesson, only: [:edit, :update, :show]

  def create
    @category = Category.find_by id: params[:category_id]
    @lesson = @category.lessons.build user: current_user
    if @lesson.save
      flash[:success] = t "start_lesson"
      redirect_to edit_category_lesson_path @category.id, @lesson
    else
      flash[:danger] = t "fail_message"
      redirect_to categories_path
    end
  end

  def edit
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = t "done_lesson"
      redirect_to category_lesson_path
    else
      flash[:danger] = t "fail_message"
      redirect_to categories_path
    end
  end

  def show
    @score = @lesson.results.correct_anwsers.size
    @results = @lesson.results
  end

  private
  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
    unless @lesson
      flash[:danger] = t "lesson_not_found"
      redirect_to categories_path
    end
  end

  def lesson_params
    params.require(:lesson).permit :category_id,
      results_attributes: [:id, :answer_id]
  end
end
