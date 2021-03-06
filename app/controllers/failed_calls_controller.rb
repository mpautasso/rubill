class FailedCallsController < ApplicationController

  before_filter :authenticate
  before_filter :require_admin, :except => [:index, :show]
  before_filter :check_device_existence, :unless => lambda{ current_user.admin? }
  helper_method :sort_column, :sort_direction

  # GET /failed_calls
  # GET /failed_calls.xml
  def index
    @failed_calls = begin_of_association_chain(FailedCall)
                      .search(params[:search])
                      .order(sort_column + " " + sort_direction)
                      .paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outgoing_calls }
      format.js # index.js.haml
    end
  end

  # GET /failed_calls/1
  # GET /failed_calls/1.xml
  def show
    @failed_call = FailedCall.find(params[:id])

    respond_to do |format|
      format.html { render 'show', :layout => false}
      format.xml  { render :xml => @failed_call }
    end
  end

  # GET /failed_calls/new
  # GET /failed_calls/new.xml
  def new
    @failed_call = FailedCall.new

    respond_to do |format|
      format.html { render :template => 'failed_calls/new', :layout => false}
      format.xml  { render :xml => @failed_call }
    end
  end

  # GET /failed_calls/1/edit
  def edit
    @failed_call = FailedCall.find(params[:id])
    render 'edit', :layout => false
  end

  # POST /failed_calls
  # POST /failed_calls.xml
  def create
    time = [params[:date][:hour], params[:date][:minute], params[:date][:second]].join(':')
    params[:failed_call][:calldate] = [params[:failed_call][:calldate], time].join(' ')

    @failed_call = FailedCall.new(params[:failed_call])

    respond_to do |format|
      if @failed_call.save
        format.js
        format.html { redirect_to(@failed_call, :notice => 'Failed call was successfully created.') }
        format.xml  { render :xml => @failed_call, :status => :created, :location => @failed_call }
      else
        format.js { render :error }
        format.html { render :action => "new" }
        format.xml  { render :xml => @failed_call.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /failed_calls/1
  # PUT /failed_calls/1.xml
  def update
    time = [params[:date][:hour], params[:date][:minute], params[:date][:second]].join(':')
    params[:failed_call][:calldate] = [params[:failed_call][:calldate], time].join(' ')
    @failed_call = FailedCall.find(params[:id])

    respond_to do |format|
      if @failed_call.update_attributes(params[:failed_call])
        format.js
        format.html { redirect_to(@failed_call, :notice => 'Failed call was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js { render :error }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @failed_call.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /failed_calls/1
  # DELETE /failed_calls/1.xml
  def destroy
    @failed_call = FailedCall.find(params[:id])
    @failed_call.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(failed_calls_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  
  def sort_column
    FailedCall.column_names.include?(params[:sort]) ? params[:sort] : "calldate"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  
end
