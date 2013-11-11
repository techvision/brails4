class ProfileAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #can read if its my profile or its admin
    if resource.user_id == user.id
      true
    end
  end

  def updatable_by?(user)
    #can update if its my profile or its admin
    if user.admin? || resource.user_id == user.id
      true
    end
  end

  #Admin can read all the profiles
  def self.readable_by?(user)
    user.admin?
  end
end