class TopicAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #only admin and students that finished the previous topics in the Level can read the topics
     if user.has_role?(:student) and user.profile.finished_previous_topics?(resource.id)
      true
    end
  end

  def self.manageable_by?(user)
    user.admin?
  end
end