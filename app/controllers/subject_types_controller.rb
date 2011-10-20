class SubjectTypesController < InheritedResources::Base
  respond_to :html, :xml
  load_and_authorize_resource

  def update
    @subject_type = SubjectType.find(params[:id])
    if params[:position]
      @subject_type.insert_at(params[:position])
      redirect_to subject_types_url
      return
    end
    update!
  end
end
