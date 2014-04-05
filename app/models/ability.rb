class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      # Admin can manage alls
      can :manage, :all
    else
      # sudent user 
      can :read, :all
      can :manage, Profile, user_id: user.id
    end
  end
end
