class SubjectHeadingTypesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource :except => [:index, :create]
  authorize_resource :only => [:index, :create]

  def update
    @subject_heading_type = SubjectHeadingType.find(params[:id])
    if params[:move]
      move_position(@subject_heading_type, params[:move])
      return
    end
    update!
  end

  private
  def permitted_params
    params.permit(
      subject_heading_type: [
        :name, :display_name, :note
      ]
    )
  end
end
