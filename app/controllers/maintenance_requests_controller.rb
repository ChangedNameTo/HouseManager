class MaintenanceRequestsController < ApplicationController
  before_action :authorize_action

  def new
    @maintenance_request = MaintenanceRequest.new
  end

  def edit
    @maintenance_request = MaintenanceRequest.find(params[:id])
  end

  def create
    @maintenance_request = MaintenanceRequest.new(maintenance_request_params)

    if current_user
      @maintenance_request.reporter_id     = current_user.id
      @maintenance_request.organization_id = current_user.affiliated_organization
    end

    if @maintenance_request.save
      redirect_to maintenance_requests_path
    else
      render 'new'
    end
  end

  def update
		@maintenance_request = MaintenanceRequest.find(params[:id])

		if @maintenance_request.update(maintenance_request_params)
			redirect_to @maintenance_request
		else
			render 'edit'
		end
	end

  def show
    @maintenance_request = MaintenanceRequest.find(params[:id])
    @request_comments = MaintenanceRequestComment.where(maintenance_request_id: @maintenance_request.id).order(created_at: :asc)
    @maintenance_request_comment = @maintenance_request.maintenance_request_comments.build(author: current_user)
  end

  def index
    @maintenance_requests = policy_scope(MaintenanceRequest).where(organization_id: current_user.affiliated_organization).where(finished: false).order(priority_id: :desc)
    @finished_requests = policy_scope(MaintenanceRequest).where(organization_id: current_user.affiliated_organization).where(finished: true).order(priority_id: :desc)
  end

  def destroy
    MaintenanceRequest.find(params[:id]).delete

    redirect_to maintenance_requests_path
  end

  def change_started_status
    @maintenance_request = MaintenanceRequest.find(params[:maintenance_request_id])

    if @maintenance_request.started
      @maintenance_request.update_attributes(:started=>false)
    else
      @maintenance_request.update_attributes(:started=>true)
    end

    redirect_to @maintenance_request
  end

  def change_finished_status
    @maintenance_request = MaintenanceRequest.find(params[:maintenance_request_id])

    if @maintenance_request.finished
      @maintenance_request.update_attributes(:finished=>false)
    else
      @maintenance_request.update_attributes(:finished=>true)
    end

    redirect_to @maintenance_request
  end

  private

  def maintenance_request_params
    params.require(:maintenance_request).permit(
      :issue_title,
      :description,
      :reporter_id,
      :organization_id,
      :priority_id
    )
  end

  def maintenance_request_comment_params
    params.require(:maintenance_request_comment).permit(
      :request_id,
      :body,
      :author_id
    )
  end

  def authorize_action
    authorize MaintenanceRequest
  end
end
