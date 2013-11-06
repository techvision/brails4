class ProfileAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #can read if its my profile or its admin
    if user.admin? || resource.user_id == user.id
      true
    end
  end

  def updatable_by?(user)
    #can update if its my profile or its admin
    if user.admin? || resource.user_id == user.id
      true
    end
  end

  def deletable_by?(user)
    #can delete if its my profile or its admin
    if user.admin? || resource.user_id == user.id
      true
    end
  end
end