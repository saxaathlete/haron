# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def app_menu
    [
      {:path => "admin_articles_path",
        :name => "Статьи",
        :controller => "admin/articles"},
      {:path => "admin_products_path",
        :name => "Каталог",
        :controller => "admin/products"},
      {:path => "admin_galleries_path",
        :name => "Галерея",
        :controller => "admin/galleries"},
      {:path => "admin_orders_path",
        :name => "Заказы",
        :controller => "admin/orders"},
      {:path => "admin_meny_items_path",
        :name => "Меню",
        :controller => "admin/meny_items"},
      {:path => "admin_contacts_path",
        :name => "Контакты",
        :controller => "admin/contacts"},
      {:path => "admin_company_informations_path",
        :name => "О нас",
        :controller => "admin/company_informations"}
    ]
  end

end
