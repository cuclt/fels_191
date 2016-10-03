module CategoriesHelper
  def current_index per_page, index, current_page
    per_page * (current_page - 1) + index + 1
  end
end
