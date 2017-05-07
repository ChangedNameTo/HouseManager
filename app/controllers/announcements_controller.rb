class AnnouncementsController < ApplicationController
  before_action :authorize_action

  def new
    @announcement = Announcement.new
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if current_user
      @announcement.author_id       = current_user.id
      @announcement.organization_id = current_user.affiliated_organization
    end

    if @announcement.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
		@announcement = Announcement.find(params[:id])

		if @announcement.update(announcement_params)
			redirect_to @announcement
		else
			render 'edit'
		end
	end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def index
    @announcements = policy_scope(Announcement).where(organization_id: current_user.affiliated_organization).limit(20).order(id: :desc)
  end

  private

  def announcement_params
    params.require(:announcement).permit(
      :title,
      :body,
      :author_id,
      :organization_id
    )
  end

  def authorize_action
    authorize Announcement
  end
end
