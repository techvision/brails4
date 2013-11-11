class AttemptAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #belongs to me or the user is the admin
    resource.profile_id.equal?(user.profile.id) ? true : false
  end

  def self.readable_by?(user)
    user.admin?
  end
end