class Admin::OrdersController < ApplicationController
  layout "admin"
  before_filter :login_required
  include ApplicationHelper
  def index
    @orders = Order.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Заказ успешно удален"
      redirect_to admin_orders_url
    else
      render :action => 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = "Заказ успешно обновлен"
      redirect_to admin_orders_url
    else
      render :action => 'edit'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Заказ успешно удален"
    redirect_to admin_orders_url
  end

end
