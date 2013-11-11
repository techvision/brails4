class UserAuthorizer < ApplicationAuthorizer

  def creatable_by?(user)
    
  end

  def readable_by?(user)
    user.has_role?(:student)
  end

  def updatable_by?(user)
    resource.class == Profile
  end
end