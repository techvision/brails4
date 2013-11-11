class CommentAuthorizer < ApplicationAuthorizer

  def self.readable_by?(user)
    #if is the admin user or is a student 
    if user.admin? 
      true 
    else
      false
    end
  end

  def manageable_by?(user)
    #if comment belongs to me and user has student role
    if user.has_role?(:student) and user.profile.id == resource.profile_id
      true
    else
      false
    end
  end
end