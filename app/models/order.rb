class Order < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20

  mattr_accessor :login_regex, :bad_login_message,
    :name_regex, :bad_name_message,
    :email_name_regex, :domain_head_regex, :domain_tld_regex, :email_regex, :bad_email_message
  acts_as_captcha :base => "Введите символы на картинке", :field => "Неверно введены символы"


  REGIONS = ["АР Крым","Винницкая","Волынская", "Днепропетровская", "Донецкая", "Житомирская",
    "Закарпатская", "Запорожская", "Ивано-Франковская", "Киевская",
    "Кировоградская", "Луганская", "Львовская", "Николаевская", "Одесская", "Полтавская",
    "Ровенская", "Сумская", "Тернопольская", "Харьковская", "Херсонская", "Хмельницкая", "Черкасская",
    "Черниговская", "Черновецкая"]
  bad_email_message = "должен выглядеть как email адрес".freeze
  email_name_regex  = '[\w\.%\+\-]+'.freeze
  domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
  domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
  email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i

  validates_presence_of     :first_name, :last_name, :address, :email, :telephone, :city, :region, :post_index, :message, :middle_name
  validates_numericality_of :telephone, :post_index
  validates_length_of       :email,  :within => 6..100 #r@a.wk
  validates_format_of       :email,  :with => email_regex, :message => bad_email_message
  
 

end
