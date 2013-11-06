class AttemptAuthorizer < ApplicationAuthorizer

  def readable_by?(user)
    #belongs to me or the user is the admin
    if user.admin? 
      true
    elsif resource.profile_id == user.profile.id
      true
    end
  end
end