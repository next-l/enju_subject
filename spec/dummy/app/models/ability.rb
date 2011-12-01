class Ability
  include CanCan::Ability

  def initialize(user)
    case user.try(:role).try(:name)
    when 'Administrator'
      can :manage, Subject
      can :manage, SubjectHeadingType
      can :manage, SubjectHeadingTypeHasSubject
      can :manage, Manifestation
    when 'Librarian'
      can :read, Subject
      can :read, SubjectHeadingType
      can :read, SubjectHeadingTypeHasSubject
      can :read, Manifestation
    when 'User'
      can :read, Subject
      can :read, SubjectHeadingType
      can :read, Manifestation
    else
      can :read, Subject
      can :read, SubjectHeadingType
      can :read, Manifestation
    end
  end
end
