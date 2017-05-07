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
    @organizations = policy_scope(Organization).all.order(:id)
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def destroy
    Organization.find(params[:id]).delete

    redirect_to organizations_path
  end

  def organization_enable_all
    @users = Organization.find(params[:organization_id]).provisional_members

    @users.each do |user|
      @user = User.find(user.id)
      @user.update_attributes(:enabled=> true)
      UserRole.create(:user_id => @user[:id], :role_id => 8)
    end

    redirect_to organization_path(params[:organization_id])
  end

  def organization_disable_all
    @users = Organization.find(params[:organization_id]).provisional_members

    @users.each do |user|
      @user = User.find(user.id)
      @user.update_attributes(:enabled=> false)
      @user.update_attributes(:affiliated_organization=> nil)
      @user_roles = UserRole.where(user_id: params[:user_id]).destroy_all
    end

    redirect_to organization_path(params[:organization_id])
  end

  private

  def organization_params
    params.require(:organization).permit(
      :full_name,
      :abbreviation,
      :school,
      :address,
      :organization_manager,
      :user_manager,
      :kitchen_manager,
      :house_manager,
      :service_manager,
      :scholarship_manager
    )
  end

  def authorize_action
    authorize Organization
  end
end
