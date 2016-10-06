class LessonsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update]

  def create
    @category = Category.find_by id: params[:category_id]
    @lesson = @category.lessons.build user: current_user
    if @lesson.save
      flash[:success] = t "start_lesson"
    else
      flash[:danger] = t "fail_message"
    end
    redirect_to categories_path
  end
end
