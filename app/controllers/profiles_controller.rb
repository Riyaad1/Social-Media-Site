class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  def show
    @posts = Post.where(user_id: @profile).order(created_at: :desc)
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end
