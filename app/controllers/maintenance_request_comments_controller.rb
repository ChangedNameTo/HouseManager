class MaintenanceRequestCommentsController < ApplicationController
  before_action :authorize_action

  def new
    @maintenance_request_comment = MaintenanceRequestComment.new
  end

  def edit
    @maintenance_request_comment = MaintenanceRequestComment.find(params[:id])
  end

  def create
    @maintenance_request_comment = MaintenanceRequestComment.new(maintenance_request_comment_params)

    if @maintenance_request_comment.save
      redirect_to maintenance_request_path(@maintenance_request_comment.maintenance_request)
    else
      render 'maintenance_requests/show'
    end
  end

  def update
    @maintenance_request_comment = MaintenanceRequestComment.find(params[:id])
    @maintenance_request = @maintenance_request_comment.maintenance_request

    @maintenance_request_comment.update(maintenance_request_comment_params)

    redirect_to @maintenance_request
  end

  def destroy
    @maintenance_request_comment = MaintenanceRequestComment.find(params[:id])
    @maintenance_request = @maintenance_request_comment.maintenance_request

    @maintenance_request_comment.destroy

    redirect_to @maintenance_request
  end

  private

  def maintenance_request_comment_params
    params.require(:maintenance_request_comment).permit(
      :maintenance_request_id,
      :body,
      :author_id
    )
  end

  def authorize_action
    authorize MaintenanceRequestComment
  end
end
