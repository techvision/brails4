class QuestionAuthorizer < ApplicationAuthorizer

  def creatable_by?(user)
    #only admin can create questions
    user.admin?
  end

  def readable_by?(user)
    #admin and students can create questions
    user.admin? || user.has_role?(:student)
  end

  def updatable_by?(user)
    #only admin can update a question
    user.admin?
  end

  def deletable_by?(user)
    #only admin can delete a question
    user.admin?
  end

  def manageable_by?(user)
    user.admin?
  end

  def answerable_by?(user)
    #only students can answer questions
    user.has_role?(:student)
  end
end