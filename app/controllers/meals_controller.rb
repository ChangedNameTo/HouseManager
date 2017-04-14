class MealsController < ApplicationController
  before_action :authorize_action

  def new
    @meal = Meal.new
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def create
    @meal = Meal.new(meal_params)

    if current_user
      @meal.organization_id = current_user.affiliated_organization
    end

    if @meal.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def update
    @meal = Meal.find(params[:id])

    if @meal.update(meal_params)
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  def index
    @meals = policy_scope(Meal).where(organization_id: current_user.affiliated_organization)
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def destroy
    Meal.find(params[:id]).delete

    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(
      :name,
      :time,
      :organization_id
    )
  end

  def authorize_action
    authorize Meal
  end
end
