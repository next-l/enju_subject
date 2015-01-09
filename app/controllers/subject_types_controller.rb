class SubjectTypesController < ApplicationController
  load_and_authorize_resource
  # GET /subject_types
  # GET /subject_types.json
  def index
    @subject_types = SubjectType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subject_types }
    end
  end

  # GET /subject_types/1
  # GET /subject_types/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject_type }
    end
  end

  # GET /subject_types/new
  # GET /subject_types/new.json
  def new
    @subject_type = SubjectType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject_type }
    end
  end

  # GET /subject_types/1/edit
  def edit
  end

  # POST /subject_types
  # POST /subject_types.json
  def create
    @subject_type = SubjectType.new(subject_type_params)

    respond_to do |format|
      if @subject_type.save
        format.html { redirect_to @subject_type, notice:  t('controller.successfully_created', model:  t('activerecord.models.subject_type')) }
        format.json { render json: @subject_type, status: :created, location: @subject_type }
      else
        format.html { render action: "new" }
        format.json { render json: @subject_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subject_types/1
  # PUT /subject_types/1.json
  def update
    if params[:move]
      move_position(@subject_type, params[:move])
      return
    end

    respond_to do |format|
      if @subject_type.update_attributes(subject_type_params)
        format.html { redirect_to @subject_type, notice:  t('controller.successfully_updated', model:  t('activerecord.models.subject_type')) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_types/1
  # DELETE /subject_types/1.json
  def destroy
    @subject_type.destroy

    respond_to do |format|
      format.html { redirect_to subject_types_url, notice: t('controller.successfully_deleted', model: t('activerecord.models.subject_type')) }
      format.json { head :no_content }
    end
  end

  private
  def subject_type_params
    params.require(:subject_type).permit(:name, :display_name, :note)
  end
end
