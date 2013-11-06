class LevelAuthorizer < ApplicationAuthorizer

  def creatable_by?(user)
    #only admin can create a new Level
    user.admin?
  end

  def readable_by?(user)
    #admins and students can read Levels
    if user.admin? || user.has_role?(:student)
      true
    end
  end

  def updatable_by?(user)
    #only admin can update a Level
    user.admin?
  end

  def deletable_by?(user)
    #only admin can delete a Level
    user.admin?
  end

  def manageable_by?(user)
    user.admin?
  end
end