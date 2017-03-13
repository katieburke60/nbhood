module EventsHelper

  def category_filter
    collection_check_boxes(:category, category, Category.all, :id)
  end

  # <%= check_box_tag "categories[]", category.id, true if @categories.include?(category) %>
  # <%= label_tag category.name %>

end
