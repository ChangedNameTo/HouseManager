class OrganizationsController < ApplicationController
  before_action :authorize_action

  def new
    @organization = Organization.new
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to @organization
    else
      render 'new'
    end
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update(organization_params)
      redirect_to @organization
    else
      render 'edit'
    end
  end

  def index
    @organizations = policy_scope(Organization).all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def delete
    @organization = Organization.find(params[:id])
    @organization.destroy

    redirect_to organizations_path
  end

  private
  def organization_params
    params.require(:organization).permit(
      :full_name,
      :abbreviation,
      :school,
      :address,
      :organization_manager
    )
  end

  def authorize_action
    authorize Organization
  end
end
