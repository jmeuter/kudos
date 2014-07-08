class UsersController < ApplicationController

  # our Devise authentication
  before_filter :authenticate_user!

  def show
    @user = (params[:id]) ? User.find(params[:id]) : current_user
    @organization = @user.organization
    @users = User.where('id != ? AND organization_id = ?', @user.id, @user.organization.id)
    @kudos = @user.kudos_awards

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

end