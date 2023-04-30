class StoresController < ApplicationController
  #before_action :validate_user

  def index
    @stores = Store.order(created_at: :desc)
  end

  def show
    @store = Store.find_by(id: params[:id])
  end

  def new
    @store = Store.new
  end

  def edit
    @store = Store.find_by(id: params[:id])
  end

  def create
    @user = current_user
    @store = @user.stores.create store_params
    if @store.save
      flash[:success] = "Object successfully created"
      redirect_to user_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @store = Store.find_by(id: params[:id])
    if @store.update store_params
      flash[:success] = "Object successfully updated"
      redirect_to @store
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def store_params
    params.require(:store).permit(:user_id, :title, :body, :email, :phone)
  end


end