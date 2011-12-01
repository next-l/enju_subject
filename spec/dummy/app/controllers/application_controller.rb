class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied, :with => :render_403
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  private
  def render_403
    return if performed?
    if user_signed_in?
      respond_to do |format|
        format.html {render :file => "#{Rails.root}/public/404.html", :status => 403}
        format.xml
        format.json
      end
    else
      respond_to do |format|
        format.html {redirect_to new_user_session_url}
        format.xml  {render :status => 403}
        format.json
      end
    end
  end

  def render_404
    return if performed?
    respond_to do |format|
      format.html {render :file => "#{Rails.root}/public/404.html", :status => 404}
      format.xml
      format.json
    end
  end

  def get_work
    @work = Manifestation.find(params[:work_id]) if params[:work_id]
    authorize! :show, @work if @work
  end

  def get_subject_heading_type
    @subject_heading_type = SubjectHeadingType.find(params[:subject_heading_type_id]) if params[:subject_heading_type_id]
  end

  def get_classification
    @classification = Classification.find(params[:classification_id]) if params[:classification_id]
  end

  def solr_commit
    Sunspot.commit
  end
end
