class SubjectHeadingTypesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource

  def update
    @subject_heading_type = SubjectHeadingType.find(params[:id])
    if params[:move]
      move_position(@subject_heading_type, params[:position])
      return
    end
    update!
  end
end
