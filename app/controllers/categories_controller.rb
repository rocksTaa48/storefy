class CategoriesController < ApplicationController
  def index
    @categories = Category.order(created_at: :desc)
  end

  def show
    @category = Category.find_by(id: params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def create
    @category = Category.create category_params
    if @category.save
      flash[:success] = "Object successfully created"
      redirect_to @category
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update category_params
      flash[:success] = "Object successfully updated"
      redirect_to @category
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end