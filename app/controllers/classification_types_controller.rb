class ClassificationTypesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource :except => [:index, :create]
  authorize_resource :only => [:index, :create]

  def update
    @classification_type = ClassificationType.find(params[:id])
    if params[:move]
      move_position(@classification_type, params[:move])
      return
    end
    update!
  end

  private
  def permitted_params
    params.permit(
      classification_type: [
        :name, :display_name, :note
      ]
    )
  end
end
