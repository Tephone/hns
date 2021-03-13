module PostsHelper
  def new_or_edit_path?
    if action_name == "new"
        posts_path
    elsif action_name == "edit"
        blog_path
    end
  end
end
