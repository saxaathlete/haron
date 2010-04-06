require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rubygems'

namespace :admin do
  desc "add admin"
  task :add_admin do
    require Rails.root + 'config/environment.rb'
    User.create(:login => "admin", :crypted_password => "b5e22f0cb6b526b38b4907350d279c8126108833", :salt => "601a3d25a7fd15b9f927af4aa51ace8a852b9401")


  end

end
