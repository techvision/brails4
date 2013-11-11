class ContentAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #admin and students can read the contents
    if user.admin? || user.has_role?(:student)
      true
    end
  end

  def self.manageable_by?(user)
    user.admin?
  end
end