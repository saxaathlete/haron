require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rubygems'

namespace :meny do
  desc "add manues item names"
  task :initialize_meny do
    require Rails.root + 'config/environment.rb'
    MenyItem.create(:name => "Новости", :controller => "home", :action => "index")
    MenyItem.create(:name => "Ритуальные услуги", :controller => "home", :action => "funerals")
    MenyItem.create(:name => "Памятники", :controller => "home", :action => "monuments")
    MenyItem.create(:name => "Галлерея", :controller => "home", :action => "gallery")
    MenyItem.create(:name => "Контакты", :controller => "home", :action => "contacts")
    MenyItem.create(:name => "О нас", :controller => "home", :action => "company_informations")
    
  end

end
