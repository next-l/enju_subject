class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied, :with => :render_403
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  enju_biblio
  enju_subject

  private
  def render_403
    return if performed?
    if user_signed_in?
      respond_to do |format|
        format.html {render :file => "#{Rails.root}/public/404", :status => 403}
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
      format.html {render :file => "#{Rails.root}/public/404", :status => 404}
      format.xml
      format.json
    end
  end

  def solr_commit
    Sunspot.commit
  end

  def move_position(resource, direction)
    if ['higher', 'lower'].include?(direction)
      resource.send("move_#{direction}")
      redirect_to url_for(:controller => resource.class.to_s.pluralize.underscore)
      return
    end
  end
end
