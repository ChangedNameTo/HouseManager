class ServiceHoursController < ApplicationController
  before_action :authorize_action

  def new
   @service_hour = ServiceHour.new
  end

  def edit
    @service_hour = ServiceHour.find(params[:id])
  end

  def create
    @service_hour = ServiceHour.new(service_hour_params)
    @service_hour.day = DateTime.parse(service_hour_params[:day])

    if current_user
      @service_hour.recipient_id = current_user.id
    end

    if @service_hour.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def update
    @service_hour = ServiceHour.find(params[:id])

    if @service_hour.update(service_hour_params)
      redirect_to actions: "index"
    else
      render 'edit'
    end
  end

  def show
    @service_hour = ServiceHour.find(params[:id])
  end

  def index
    @service_hours = ServiceHour.where(recipient_id: current_user.id)

    @total_hours = 0

    @service_hours&.each do |counting|
      @total_hours = @total_hours + counting.hours_and_money
    end
  end

  def admin
    @users = User.where(affiliated_organization: current_user.affiliated_organization)

    @not_started = 0
    @in_progress = 0
    @done = 0

    @users&.each do |user|
      if user.service_hours == 0
        @not_started = @not_started + 1
      elsif user.service_hours > 0 and user.service_hours < 10
        @in_progress = @in_progress + 1
      else
        @done = @done + 1
      end
    end
  end

  def show_user
    @user = User.find(params[:service_hour_id])
    @service_hours = ServiceHour.where(recipient_id: params[:service_hour_id])

    @total_hours = 0

    @service_hours&.each do |counting|
      @total_hours = @total_hours + counting.hours_and_money
    end
  end

  def destroy
    ServiceHour.find(params[:id]).delete

    redirect_to service_hours_path
  end

  private

  def service_hour_params
    params.require(:service_hour).permit(
      :title,
      :for,
      :description,
      :day,
      :hours,
      :money
    )
  end

  def authorize_action
    authorize ServiceHour
  end
end
