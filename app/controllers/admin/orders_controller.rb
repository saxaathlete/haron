class Admin::OrdersController < ApplicationController
  include ApplicationHelper
  def index
    @orders = Order.all
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
    @order_status = ["Новый","В обработке","Доставлен и оплачен","Деньги возвращены","Отправлен","Отложен","Отменен"]
  end

  def update
    @order_status = ["ВЫА","ЫВА","ыва"]
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
    @line_items = LineItem.find_all_by_order_id @order.id
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Заказ успешно удален"
    redirect_to admin_orders_url
  end

end
