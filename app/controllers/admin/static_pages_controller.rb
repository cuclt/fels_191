class Admin::StaticPagesController < ApplicationController
  def home
    @categories = Category.newest.paginate page: params[:page], per_page: Settings.per_page
  end
end
