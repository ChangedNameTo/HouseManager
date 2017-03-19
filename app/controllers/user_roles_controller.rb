class UserRolesController < ApplicationController
  before_action :authorize_action

  def index
    @user_roles = policy_scope(UserRole)
  end

  def show
    @user = User.find(params[:id])
    @user_roles = policy_scope(@user.user_roles)
  end

  def create
    role = Role.find(params[:role_id])
    user = User.find(params[:user_id])

    UserRole.create(user: user, role: role)
  end

  def destroy
    user_role = UserRole.find(params[:id])
    user_role.destroy
    redirect_to roles_user_path(user_role.user)
  end

  private

  def authorize_action
    authorize UserRole
  end
end
