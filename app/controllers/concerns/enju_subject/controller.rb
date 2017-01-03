module EnjuSubject
  module Controller

    private

    def set_parent_subject_heading_type
      if params[:subject_heading_type_id]
        @subject_heading_type = SubjectHeadingType.find(params[:subject_heading_type_id])
        authorize @subject_heading_type, :show?
      end
    end

    def set_parent_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
        authorize @subject, :show?
      end
    end

    def set_parent_classification
      if params[:classification_id]
        @classification = Classification.find(params[:classification_id])
        authorize @classification, :show?
      end
    end

    def set_parent_classification_type
      @classification_type = ClassificationType.find(params[:classification_type_id]) rescue nil
    end
  end
end
