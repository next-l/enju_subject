class Ability
  include CanCan::Ability

  def initialize(user)
    case user.try(:role).try(:name)
    when 'Administrator'
      can :manage, Subject
      can :manage, Manifestation
    else
      can :read, Subject
      can :read, Manifestation
    end
  end
end
