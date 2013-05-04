module EnjuSubject
  class Ability
    include CanCan::Ability
        
    def initialize(user, ip_address = nil)
      case user.try(:role).try(:name)
      when 'Administrator'
        can :manage, [
          Classification,
          Subject,
          SubjectHeadingTypeHasSubject
        ]
        can :manage, WorkHasSubject
        if LibraryGroup.site_config.network_access_allowed?(ip_address)
          can [:read, :create, :update], ClassificationType
          can [:destroy, :delete], ClassificationType do |classification_type|
            classification_type.classifications.empty?
          end
          can :manage, [
            Classification,
            Subject,
            SubjectHeadingType,
            SubjectType
          ]
        else
          can :read, [
            ClassificationType,
            SubjectHeadingType,
            SubjectType
          ]
        end
      when 'Librarian'
        can :manage, [
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
          SubjectHeadingType,
          WorkHasSubject
        ]
      else
        can :read, [
          Classification,
          ClassificationType,
          Subject,
          SubjectHeadingType,
          WorkHasSubject
        ]
      end
    end
  end
end
