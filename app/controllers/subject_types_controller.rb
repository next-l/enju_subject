class SubjectTypesController < ApplicationController
  before_action :set_subject_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  after_action :verify_policy_scoped, :only => :index

  # GET /subject_types
  def index
    authorize SubjectType
    @subject_types = policy_scope(SubjectType).order(:position)
  end

  # GET /subject_types/1
  def show
  end

  # GET /subject_types/new
  def new
    @subject_type = SubjectType.new
    authorize @subject_type
  end

  # GET /subject_types/1/edit
  def edit
  end

  # POST /subject_types
  def create
    @subject_type = SubjectType.new(subject_type_params)
    authorize @subject_type

    if @subject_type.save
      redirect_to @subject_type, notice:  t('controller.successfully_created', :model => t('activerecord.models.subject_type'))
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /subject_types/1
  def update
    if params[:move]
      move_position(@subject_type, params[:move])
      return
    end
    if @subject_type.update(subject_type_params)
      redirect_to @subject_type, notice:  t('controller.successfully_updated', :model => t('activerecord.models.subject_type'))
    else
      render action: 'edit'
    end
  end

  # DELETE /subject_types/1
  def destroy
    @subject_type.destroy
    redirect_to subject_types_url, notice: 'Subject type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_type
      @subject_type = SubjectType.find(params[:id])
      authorize @subject_type
    end

    # Only allow a trusted parameter "white list" through.
    def subject_type_params
      params.require(:subject_type).permit(:name, :display_name, :note)
    end
end
