class SubjectHeadingTypesController < InheritedResources::Base
  respond_to :html, :xml
  load_and_authorize_resource

  def update
    @subject_heading_type = SubjectHeadingType.find(params[:id])
    if params[:position]
      @subject_heading_type.insert_at(params[:position])
      redirect_to subject_heading_types_url
      return
    end
    update!
  end
end
