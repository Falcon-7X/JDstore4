class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    redirect :back
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect :back
  end

end
