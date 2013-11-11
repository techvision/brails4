class FeedbackAuthorizer < ApplicationAuthorizer

  def creatable_by?(user)
    #Only a student can create a feedback
    user.has_role?(:student)
  end

  def self.readable_by?(user)
    #Only admin can read the feebacks
    user.admin? 
  end
end