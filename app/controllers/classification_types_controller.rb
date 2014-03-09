class ClassificationTypesController < ApplicationController
  before_action :set_classification_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  after_action :verify_policy_scoped, :only => :index

  # GET /classification_types
  def index
    authorize ClassificationType
    @classification_types = policy_scope(ClassificationType).order(:position)
  end

  # GET /classification_types/1
  def show
  end

  # GET /classification_types/new
  def new
    @classification_type = ClassificationType.new
    authorize @classification_type
  end

  # GET /classification_types/1/edit
  def edit
  end

  # POST /classification_types
  def create
    @classification_type = ClassificationType.new(classification_type_params)
    authorize @classification_type

    if @classification_type.save
      redirect_to @classification_type, notice:  t('controller.successfully_created', :model => t('activerecord.models.classification_type'))
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /classification_types/1
  def update
    if params[:move]
      move_position(@classification_type, params[:move])
      return
    end
    if @classification_type.update(classification_type_params)
      redirect_to @classification_type, notice:  t('controller.successfully_updated', :model => t('activerecord.models.classification_type'))
    else
      render action: 'edit'
    end
  end

  # DELETE /classification_types/1
  def destroy
    @classification_type.destroy
    redirect_to classification_types_url, notice: 'Classification type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification_type
      @classification_type = ClassificationType.find(params[:id])
      authorize @classification_type
    end

    # Only allow a trusted parameter "white list" through.
    def classification_type_params
      params.require(:classification_type).permit(:name, :display_name, :note)
    end
end
