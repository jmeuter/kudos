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

    def give_kudos
      # our primary and kudos users
      @user = User.find(params[:id])
      @kudos_user = User.where(id: params[:kudos_user_id]).first

      # let's double check our primary users availabe kudos to award
      kudos = Kudo.primary_kudos(@user)
      @kudo = (kudos.empty?) ? nil : kudos.first

      respond_to do |format|
        if @kudo.nil?

        elsif @kudo.update_attribute(:kudos_user_id, @kudos_user.id)
          format.html { redirect_to @user, notice: "You have successfully awarded #{@kudos_user.fullname} a kudo" }
          format.json { head :ok }
        else
          format.html { redirect_to @user, notice: "There was an error awarding your kudos to #{@kudos_user.fullname}" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

    end
  end

end