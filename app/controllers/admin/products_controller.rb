class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "成功上架一个商品"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "成功修改商品信息"
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "商品已删除"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end