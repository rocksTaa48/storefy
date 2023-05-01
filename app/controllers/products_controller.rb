class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def user_products
    @user = current_user
    if @user.id == params[:user_id].to_i
      @products = Product.where(user_id: params[:user_id])
    else
      not_found
    end
  end

  def new
    @product = Product.new
    @categories = Category.order(created_at: :desc)
    @subcategories = Subcategory.order(created_at: :desc)
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def create
    @user = current_user
    if @user.status == "seller"
      @product = @user.products.create product_params
      if @product.save
        flash[:success] = "Object successfully created"
        redirect_to @product
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    else
      flash[:error] = "Need to create seller account"
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update product_params
      flash[:success] = "Object successfully updated"
      redirect_to @product
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :body, :quantity, :price, :subcategory_id, :user_id)
  end
end