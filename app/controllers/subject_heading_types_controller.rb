class SubjectHeadingTypesController < ApplicationController
  before_action :set_subject_heading_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  after_action :verify_policy_scoped, :only => :index

  # GET /subject_heading_types
  def index
    authorize SubjectHeadingType
    @subject_heading_types = policy_scope(SubjectHeadingType).order(:position)
  end

  # GET /subject_heading_types/1
  def show
  end

  # GET /subject_heading_types/new
  def new
    @subject_heading_type = SubjectHeadingType.new
    authorize @subject_heading_type
  end

  # GET /subject_heading_types/1/edit
  def edit
  end

  # POST /subject_heading_types
  def create
    @subject_heading_type = SubjectHeadingType.new(subject_heading_type_params)
    authorize @subject_heading_type

    if @subject_heading_type.save
      redirect_to @subject_heading_type, notice:  t('controller.successfully_created', :model => t('activerecord.models.subject_heading_type'))
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /subject_heading_types/1
  def update
    if params[:move]
      move_position(@subject_heading_type, params[:move])
      return
    end
    if @subject_heading_type.update(subject_heading_type_params)
      redirect_to @subject_heading_type, notice:  t('controller.successfully_updated', :model => t('activerecord.models.subject_heading_type'))
    else
      render action: 'edit'
    end
  end

  # DELETE /subject_heading_types/1
  def destroy
    @subject_heading_type.destroy
    redirect_to subject_heading_types_url, notice: 'Subject type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_heading_type
      @subject_heading_type = SubjectHeadingType.find(params[:id])
      authorize @subject_heading_type
    end

    # Only allow a trusted parameter "white list" through.
    def subject_heading_type_params
      params.require(:subject_heading_type).permit(:name, :display_name, :note)
    end
end
