class Admin::GalleriesController < ApplicationController
  layout "gallery"
  before_filter :login_required
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
    render :layout => "layouts/admin"
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      flash[:notice] = "Фотография добавлена в галлерею"
      redirect_to admin_galleries_url
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    render :layout => "layouts/admin"
  end

  def update
    @gallery = Gallery.find(params[:id])
   
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Фотография успешно обновлена"
      redirect_to admin_galleries_url
    else
      render :action => 'edit'
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Фотография успешно удалена"
    redirect_to admin_galleries_url
  end
end
