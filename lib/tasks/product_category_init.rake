require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rubygems'

namespace :product_category do
  desc "add basic categories"
  task :initialize_categories do
    require Rails.root + 'config/environment.rb'
    ProductCategory.create(:category_name => "Ритуальные услуги", :category_type => ProductCategory::Type::FUNERALS)
    ProductCategory.create(:category_name => "Памятники", :category_type => ProductCategory::Type::MONUMENTS)
    ProductCategory.create(:parent_id => ProductCategory.find_by_category_name("Ритуальные услуги").id ,:category_name => "Венки", :category_type => ProductCategory::Type::FUNERALS)
    ProductCategory.create(:parent_id => ProductCategory.find_by_category_name("Ритуальные услуги").id, :category_name => "Каркасы", :category_type => ProductCategory::Type::FUNERALS)
    ProductCategory.create(:parent_id => ProductCategory.find_by_category_name("Памятники").id, :category_name => "Бетон", :category_type => ProductCategory::Type::MONUMENTS)
    ProductCategory.create(:parent_id => ProductCategory.find_by_category_name("Памятники").id, :category_name => "Гранит", :category_type => ProductCategory::Type::MONUMENTS)

  end

end