class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find( params[ :id ] )
  end

  def create
		@user = User.new( user_params )

		if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_address, :phone_number)
    end
end
