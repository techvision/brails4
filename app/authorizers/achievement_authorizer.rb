class AchievementAuthorizer < ApplicationAuthorizer

  def self.readable_by?(user)
    #belongs to me or the user is the admin
    if user.admin?
      true 
    end
  end

  def readable_by?(user)
    resource.profile == user.profile ? true : false
  end
end