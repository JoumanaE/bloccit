module PostsHelper

  def user_is_authorized_for_posts?(post)
    if current_user
      return current_user == post.user || current_user.admin?
    end
  end
end
