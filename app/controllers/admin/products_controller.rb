class Admin::ProductsController < ApplicationController
  layout "admin"
  before_filter :login_required, :only => [:index, :show, :new, :create, :edit, :update, :destroy, :show_product_table]
  before_filter :find_category, :only => [:new, :create, :edit, :update, :show_product_table]

  uses_tiny_mce :only => [:new, :create, :edit, :update],
    :options => {
    :theme => 'advanced',
    :theme_advanced_resize_horizontal => true,
    :theme_advanced_resizing => false,

    :theme_advanced_buttons1 => "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
    :theme_advanced_buttons2 => "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
    :theme_advanced_buttons3 => "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
    :theme_advanced_buttons4 => "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
    :theme_advanced_toolbar_location => "top",
    :theme_advanced_toolbar_align => "left",
    :theme_advanced_statusbar_location => "bottom",
    :plugins => %w{safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager},

  }
  def index
    
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.product_category_id = @category.id
    @product.category_type = @category.category_type
    if @product.save
      flash[:notice] = "Товар успешно добавлен"
      redirect_to admin_products_url
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      flash[:notice] = "Товар #{@product.title}, успешно обновлен"
      redirect_to admin_products_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Товар удален"
      redirect_to admin_products_url
    else
      flash[:error] = "При удалении товара возникли ошибки"
      redirect_to admin_products_url
    end
  end

  def tree_funeral
    render :text => ProductCategory.funerals_tree.to_json
  end

  def tree_monument
    render :text => ProductCategory.monuments_tree.to_json
  end

  def show_product_table
    @products = Product.paginate :conditions => ["product_category_id IN(?)", @category.all_sub_categories_ids], :page => params[:page], :order => "created_at DESC"
    render :update do |page|
      page['product_data'].replace_html :partial => 'shared/products'
    end
  end

  protected
  def find_category
    @category = ProductCategory.find_by_id params[:parent_id].to_i
  end


end
