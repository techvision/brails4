class ContentAuthorizer < ApplicationAuthorizer

  def creatable_by?(user)
    #only admin can create contents
    user.admin?
  end

  def readable_by?(user)
    #admin and students can read the contents
    if user.admin? || user.has_role?(:student)
      true
    end
  end

  def updatable_by?(user)
    #Only admin can update a content
    user.admin?
  end

  def deletable_by?(user)
    #only admin can delete a content
    user.admin?
  end

  def manageable_by?(user)
    user.admin?
  end
end