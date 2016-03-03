module TopicsHelper

  def user_is_authorized_for_topics?
    current_user && current_user.admin?
  end
end

  def form_group_tag(errors, &block)

    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
