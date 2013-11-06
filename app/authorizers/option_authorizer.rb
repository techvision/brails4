class OptionAuthorizer < ApplicationAuthorizer

  def creatable_by?(user)
    #Only admin can create an option
    user.admin?
  end

  def readable_by?(user)
    #admin and students can read Options
    user.admin? || user.has_role?(:student)
  end

  def updatable_by?(user)
    #only admin can update an Option
    user.admin?
  end

  def deletable_by?(user)
    #only admin can delete an Option
    user.admin?
  end

  def manageable_by?(user)
    user.admin?
  end
end