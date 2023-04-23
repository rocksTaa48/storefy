class StoresController < ApplicationController

  def index
    @stores = Store.order(created_at: :desc)
  end

  def show
    @store = Store.find_by(id: params[:id])
  end



end