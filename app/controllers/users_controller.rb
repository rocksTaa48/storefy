class UsersController < ApplicationController

  before_action :validate_user

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def validate_user
    redirect_to root_path unless current_user.id.to_s == params[:id]
  end

end