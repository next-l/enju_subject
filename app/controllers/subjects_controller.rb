# -*- encoding: utf-8 -*-
class SubjectsController < ApplicationController
  load_and_authorize_resource :except => :index
  authorize_resource :only => :index
  before_filter :prepare_options, :only => :new
  after_filter :solr_commit, :only => [:create, :update, :destroy]
  cache_sweeper :subject_sweeper, :only => [:create, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    sort = {:sort_by => 'created_at', :order => 'desc'}
    case params[:sort_by]
    when 'name'
      sort[:sort_by] = 'term'
    end
    sort[:order] = 'asc' if params[:order] == 'asc'

    search = Subject.search
    query = params[:query].to_s.strip
    unless query.blank?
      @query = query.dup
      query = query.gsub('　', ' ')
      search.build do
        fulltext query
      end
    end

    search.build do
      order_by sort[:sort_by], sort[:order]
    end

    role = current_user.try(:role) || Role.default_role
    search.build do
      with(:required_role_id).less_than_or_equal_to role.id
    end

    page = params[:page] || 1
    search.query.paginate(page.to_i, Subject.default_per_page)
    @subjects = search.execute!.results
    session[:params] = {} unless session[:params]
    session[:params][:subject] = params

    flash[:page_info] = {:page => page, :query => query}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @subjects }
      format.rss
      format.atom
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    if params[:term]
      subject = Subject.where(:term => params[:term]).first
      redirected_to subject
      return
    end

    search = Sunspot.new_search(Manifestation)
    subject = @subject
    search.build do
      with(:subject_ids).equal_to subject.id if subject
    end
    page = params[:work_page] || 1
    search.query.paginate(page.to_i, Manifestation.default_per_page)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @subject }
    end
  end

  # GET /subjects/new
  def new
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, :notice => t('controller.successfully_created', :model => t('activerecord.models.subject')) }
        format.json { render :json => @subject, :status => :created, :location => @subject }
      else
        prepare_options
        format.html { render :action => "new" }
        format.json { render :json => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to @subject, :notice => t('controller.successfully_updated', :model => t('activerecord.models.subject')) }
        format.json { head :no_content }
      else
        prepare_options
        format.html { render :action => "edit" }
        format.json { render :json => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  private
  def prepare_options
    @subject_heading_types = SubjectHeadingType.select([:id, :display_name, :position])
  end
end
