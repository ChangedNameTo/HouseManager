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
    @meals = policy_scope(Meal).all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def delete
    @meal = Meal.find(params[:id])
    @meal.destroy

    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(
      :name,
      :time
    )
  end

  def authorize_action
    authorize Meal
  end
end
