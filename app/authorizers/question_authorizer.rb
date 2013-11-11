class QuestionAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #admin and students can create questions
    user.has_role?(:student)
  end

  def self.manageable_by?(user)
    user.admin?
  end

  def answerable_by?(user)
    #only students can answer questions
    user.has_role?(:student)
  end
end