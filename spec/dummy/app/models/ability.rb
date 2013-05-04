#module EnjuSubject
  class Ability
    include CanCan::Ability
        
    def initialize(user, ip_address = '0.0.0.0')
      case user.try(:role).try(:name)
      when 'Administrator'
        can :manage, [
          Classification,
          Subject
        ]
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
        can :read, Manifestation
      when 'Librarian'
        can :read, [
          Classification,
          ClassificationType,
          Subject,
          SubjectType,
          SubjectHeadingType
        ]
        can :read, Manifestation
      when 'User'
        can :read, [
          Classification,
          ClassificationType,
          Subject,
          SubjectHeadingType
        ]
        can :read, Manifestation
      else
        can :read, [
          Classification,
          ClassificationType,
          Subject,
          SubjectHeadingType
        ]
        can :read, Manifestation
      end
    end
  end
#end
