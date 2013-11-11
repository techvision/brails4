class LevelAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #admins and students can read Levels
    if user.admin? || user.has_role?(:student)
      true
    end
  end

  def self.manageable_by?(user)
    user.admin?
  end
end