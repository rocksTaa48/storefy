class SubcategoriesController < ApplicationController

  def index
    @subcategories = Subcategory.order(created_at: :desc)
  end

  def show
    @subcategory = Subcategory.find_by(id: params[:id])
  end

  def new
    @subcategory = Subcategory.new
    @categories = Category.order(created_at: :desc)
  end

  def edit
    @subcategory = Subcategory.find_by(id: params[:id])
  end

  def create
    @subcategory = Subcategory.create subcategory_params
    if @subcategory.save
      flash[:success] = "Object successfully created"
      redirect_to @subcategory
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @subcategory = Subcategory.find_by(id: params[:id])
    if @subcategory.update subcategory_params
      flash[:success] = "Object successfully updated"
      redirect_to @subcategory
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private
  def subcategory_params
    params.require(:subcategory).permit(:title, :body, :category_id)
  end
end