class Admin::ProductCategoriesController < ApplicationController
  layout "admin"
  before_filter :find_category, :only => [:new, :create]
  before_filter :login_required
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
    :plugins => %w{safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager}

  }

  def index
  end

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.new(params[:product_category])
    @product_category.parent_id = @category.id
    @category = ProductCategory.find_by_id params[:parent_id].to_i
    @product_category.category_type = @category.category_type

    if @product_category.save
      flash[:notice] = "Категория успешно создана"
      redirect_to admin_products_url
    else
      render :action => 'new'
    end
  end

  def edit
    @category = ProductCategory.find_by_id params[:id].to_i
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])

    if @product_category.update_attributes(params[:product_category])
      flash[:notice] = "Категория успешно обновлена"
      redirect_to admin_products_url
    else
      render :action => 'edit'
    end
  end

  def show
  end

  def destroy
    @product_category = ProductCategory.find(params[:id])
    @products = @product_category.find_all_products_by_sub_categories_ids
    if @product_category.destroy
      flash[:notice] = "Категория успешно удалена"
      redirect_to admin_products_url
    else
      flash[:error] = "При удалении категории возникли ошибки"
      redirect_to admin_products_url
    end

  end

  protected
  def find_category
    @category = ProductCategory.find_by_id params[:parent_id].to_i
  end
end
