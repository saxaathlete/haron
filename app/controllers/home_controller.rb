class HomeController < ApplicationController
  before_filter :find_category, :only => [:funerals, :momuments, :show_product_table, :show_funerals,
    :show_monuments]


  def index
    @company_informations = CompanyInformation.all
    @articles = Article.by_news.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def funerals
    if params[:funerals_article]
      render :update do |page|
        page.redirect_to funerals_home_path
      end
    end
    unless @category.blank?
      @products = Product.paginate :conditions => ["product_category_id IN(?)", @category.all_sub_categories_ids], :page => params[:page], :order => "created_at DESC"
    else
      @funerals_news = Article.by_funerals.paginate :page => params[:page], :order => 'created_at DESC'
    end
  end


  def show_funerals
    parent_id = @category.id
    render :update do |page|
      page.redirect_to funerals_home_path(:parent_id => parent_id)
    end
  end

  def monuments
    if params[:monuments_article]
      render :update do |page|
        page.redirect_to monuments_home_path
      end
    end
    unless @category.blank?
      @products = Product.paginate :conditions => ["product_category_id IN(?)", @category.all_sub_categories_ids], :page => params[:page], :order => "created_at DESC"
    else
      @monuments_news = Article.by_monuments.paginate :page => params[:page], :order => 'created_at DESC'
    end
  end

  def show_monuments
    parent_id = @category.id
    render :update do |page|
      page.redirect_to monuments_home_path(:parent_id => parent_id)
    end
  end

  def gallery
    @galleries = Gallery.all
  end

  def contacts
    @contacts = Contact.all
  end

  def company_informations
    @company_informations = CompanyInformation.all
  end
  
  def show_product_table
    @products = Product.paginate :conditions => ["product_category_id IN(?)", @category.all_sub_categories_ids], :page => params[:page], :order => "created_at DESC"
    render :update do |page|
      page['product_data'].replace_html :partial => 'shared/products'
    end
  end

  def checkout
    @order = Order.new
    reset_captcha
  end

  def save_order
    @order = Order.new(params[:order])
    @order.known_captcha = session[:captcha]
    @order.captcha = params[:captcha]
    if @order.save
      Notifier.deliver_order_information(@order)
      flash[:notice] = "Спасибо за сообщение"
      reset_captcha
      redirect_to root_url
    else
      reset_captcha
      render :action => "checkout"
    end
  end

  def show_article
    @article = Article.find(params[:id])
  end
  
  protected
  def find_category
    @category = ProductCategory.find_by_id params[:parent_id].to_i
  end

 
end
