class CommentAuthorizer < ApplicationAuthorizer

  def creatable_by?(user)
    #only student can create a new comment
    user.has_role?(:student)
  end

  def readable_by?(user)
    #if is the admin user or is a student 
    if user.admin?
      true 
    elsif user.has_role?(:student)
      true
    end
  end

  def updatable_by?(user)
    #if comment belongs to me and user has student role
    if user.has_role?(:student) and user.profile.id == resource.profile_id
      true
    end
  end

  def deletable_by?(user)
    #if comment belongs to me and user has student role
    if user.has_role?(:student) and user.profile.id == resource.profile_id
      true
    end
  end

  def manageable_by?(user)
    #if comment belongs to me and user has student role
    if user.has_role?(:student) and user.profile.id == resource.profile_id
      true
    end
  end
end