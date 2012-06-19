require "enju_subject/engine"

module EnjuSubject
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def enju_subject
      include EnjuSubject::InstanceMethods
    end
  end

  module InstanceMethods
    private

    def get_subject_heading_type
      @subject_heading_type = SubjectHeadingType.find(params[:subject_heading_type_id]) if params[:subject_heading_type_id]
    end

    def get_subject
      @subject = Subject.find(params[:subject_id]) if params[:subject_id]
    end

    def get_classification
      @classification = Classification.find(params[:classification_id]) if params[:classification_id]
    end
  end
end

ActionController::Base.send(:include, EnjuSubject)
