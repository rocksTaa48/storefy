class UsersController < ApplicationController

  before_action :validate_user

  def show
    @user = User.find_by(id: params[:id])
    @product = Product.find_by(user_id: params[:id])
  end

  private

  def validate_user
    redirect_to root_path unless current_user.id == params[:id].to_i
  end

end