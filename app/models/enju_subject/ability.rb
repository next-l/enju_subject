module EnjuSubject
  class Ability
    include CanCan::Ability
        
    def initialize(user, ip_address = nil)
      case user.try(:role).try(:name)
      when 'Administrator'
        can :read, [
          ClassificationType,
          SubjectHeadingType,
          SubjectType
        ]
        can :manage, [
          Classification,
          Subject,
          SubjectHasClassification,
          SubjectHeadingTypeHasSubject
        ]
        can :manage, WorkHasSubject
        if LibraryGroup.site_config.network_access_allowed?(ip_address)
          can [:create, :update], ClassificationType
          can :destroy, ClassificationType do |classification_type|
            classification_type.classifications.empty?
          end
          can :manage, [
            Classification,
            Subject,
            SubjectHasClassification,
            SubjectHeadingType,
            SubjectType
          ]
        end
      when 'Librarian'
        can :read, [
          Classification,
          ClassificationType,
          Subject,
          SubjectType,
          SubjectHeadingType,
          SubjectHeadingTypeHasSubject
        ]
        can :manage, [
          SubjectHasClassification,
          WorkHasSubject
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
