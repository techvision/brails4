class AchievementAuthorizer < ApplicationAuthorizer

  def self.readable_by?(current_user)
    #belongs to me or the user is the admin
    if current_user.admin?
      true 
    end
  end

  def readable_by?(current_user)
    resource.profile == user.profile ? true : false
  end
end
