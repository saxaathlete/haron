class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :delete_all
  mattr_accessor :login_regex, :bad_login_message,
    :name_regex, :bad_name_message,
    :email_name_regex, :domain_head_regex, :domain_tld_regex, :email_regex, :bad_email_message
  acts_as_captcha :base => "Введите символы на картинке", :field => "Неверно введены символы"


  REGIONS = ["АР Крым","Винницкая","Волынская", "Днепропетровская", "Донецкая", "Житомирская",
    "Закарпатская", "Запорожская", "Ивано-Франковская", "Киевская",
    "Кировоградская", "Луганская", "Львовская", "Николаевская", "Одесская", "Полтавская",
    "Ровенская", "Сумская", "Тернопольская", "Харьковская", "Херсонская", "Хмельницкая", "Черкасская",
    "Черниговская", "Черновецкая"]

  validates_presence_of     :first_name, :last_name, :address, :email, :telephone, :city, :region, :post_index, :message
  validates_numericality_of :telephone, :post_index
  validates_length_of       :email,  :within => 6..100 #r@a.wk

end
