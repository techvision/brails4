class TopicAuthorizer < ApplicationAuthorizer

  def creatable_by?(user)
    #only admin can create a topic
    user.admin?
  end

  def readable_by?(user)
    #only admin and students that finished the previous topics in the Level can read the topics
    if user.admin? 
      true
     elsif user.has_role?(:student) and resource.level.finished_previous_topics?(user.id, resource.id)
      true
    end
  end

  def updatable_by?(user)
    #only admin can update a topic
    user.admin?
  end

  def deletable_by?(user)
    #only admin can delete a topic
    user.admin?
  end

  def manageable_by?(user)
    user.admin?
  end
end