class Admin::ContactsController < ApplicationController
  layout "admin"
  before_filter :login_required
  uses_tiny_mce :only => [:new, :create, :edit, :update],
    :options => {
    :theme => 'advanced',
    :plugins => %w{safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template},
    :language => 'ru',
    :theme_advanced_buttons1 => "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
    :theme_advanced_buttons2 => "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,code",
    :theme_advanced_buttons3 => "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print",
    :theme_advanced_buttons4 => "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage,insertdate,inserttime,preview,|,forecolor,backcolor",
    :theme_advanced_resize_horizontal => true,
    :theme_advanced_resizing => false,
    :theme_advanced_statusbar_location => "bottom",
    :theme_advanced_toolbar_align => "left",
    :theme_advanced_toolbar_location => "top"
  }


  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      flash[:notice] = "Контакт успешно добавлен"
      redirect_to admin_contacts_path
    else
      render :action => 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Контакт успешно обновлен"
      redirect_to admin_contacts_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Контакт успешно удален"
    redirect_to admin_contacts_url
  end

  def show
  end 

end
