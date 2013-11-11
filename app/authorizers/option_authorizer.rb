class OptionAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #admin and students can read Options
    user.admin? || user.has_role?(:student)
  end

  def self.manageable_by?(user)
    user.admin?
  end
end