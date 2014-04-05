module NavigationsHelper

  def link_with_li(anchor_text, path, active = false)
    content_tag :li, active ? {class: "active"} : {} do
      link_to anchor_text, path 
    end
  end

  def root_active?
    controller_name == "levels" && action_name == "index" 
  end

  def levels_active?
    controller_name == "levels"
  end

  def profile_active?
    controller_name == "profiles"
  end

  def admin_levels_active?
    admin_namespace? && controller_name == "levels"
  end

  def admin_users_active?
    admin_namespace? && controller_name == "users"
  end

  def admin_feedbacks_active?
    admin_namespace? && controller_name == "feedbacks"
  end

  def admin_namespace?
    current_user.admin? 
  end
end