class Admin::MenyItemsController < ApplicationController
  def index
    @meny_items = MenyItem.all
  end

  def edit
    @meny_item = MenyItem.find(params[:id])
  end

  def update
    @meny_item = MenyItem.find(params[:id])
    if @meny_item.update_attributes(params[:meny_item])
      flash[:notice] = "Successfully updated meny items."
      redirect_to admin_meny_items_path
    else
      render :action => 'edit'
    end
  end
end
