module EnjuSubject
class Ability
  include CanCan::Ability

  def initialize(user, ip_address)
    case user.try(:role).try(:name)
    when 'Administrator'
      can [:read, :create, :update], ClassificationType
      can :destroy, ClassificationType do |classification_type|
        classification_type.classifications.empty?
      end
      can :manage, [
        Classification,
        Subject,
        SubjectHasClassification,
        SubjectHeadingType,
        SubjectHeadingTypeHasSubject,
        SubjectType,
        WorkHasSubject
      ]
    when 'Librarian'
      can :manage, [
        SubjectHasClassification,
        WorkHasSubject
      ]
      can :read, [
        Classification,
        ClassificationType,
        Subject,
        SubjectType,
        SubjectHeadingType,
        SubjectHeadingTypeHasSubject
      ]
    when 'User'
      can :read, [
        Classification,
        ClassificationType,
        Subject,
        SubjectHasClassification,
        SubjectHeadingType,
        WorkHasSubject
      ]
    else
      can :read, [
        Classification,
        ClassificationType,
        Subject,
        SubjectHasClassification,
        SubjectHeadingType,
        WorkHasSubject
      ]
    end
  end
end
end
