class LatePlatesController < ApplicationController
  before_action :authorize_action

  def new
    @late_plate = LatePlate.new
  end

  def edit
    @late_plate = LatePlate.find(params[:id])
  end

  def create
    @late_plate = LatePlate.new(late_plate_params)
      if current_user
        @late_plate.user_id = current_user.id
        @late_plate.organization_id = current_user.affiliated_organization
      end

    if @late_plate.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def update
    @late_plate = LatePlate.find(params[:id])

    if @late_plate.update(late_plate_params)
      redirect_to @late_plate
    else
      render 'edit'
    end
  end

  def index
    @late_plates = policy_scope(LatePlate).all
  end

  def show
    @late_plate = LatePlate.find(params[:id])
  end

  def delete
    @late_plate = LatePlate.find(params[:id])
    @late_plate.destroy

    redirect_to late_plates_path
  end

  private

  def late_plate_params
    params.require(:late_plate).permit(
      :meal_id,
      :day,
      :completed,
      :user_id,
      :organization_id
    )
  end

  def authorize_action
    authorize LatePlate
  end
end
