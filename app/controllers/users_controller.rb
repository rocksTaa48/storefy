class UsersController < ApplicationController

  before_action :validate_user

  def show
    @user = User.find_by(name: params[:id])
    @stores = current_user.stores
  end

  private

  def validate_user
    redirect_to root_path unless current_user.name.parameterize == params[:id]
  end

end