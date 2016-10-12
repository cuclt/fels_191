class Admin::QuestionsController < ApplicationController

  def new
    @question = Question.new
    @categories = Category.all
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t "saved"
    else
      flash[:danger] = t "save_not_success"
    end
    redirect_to new_admin_question_path
  end

  private
  def question_params
    params.require(:question).permit(
      :name, :category_id,
      answers_attributes: [:name, :is_correct]
    )
  end
end
