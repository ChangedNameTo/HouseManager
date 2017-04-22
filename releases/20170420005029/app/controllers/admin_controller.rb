class AdminController < ApplicationController
  def home
    authorize :admin, :home?
  end
end
