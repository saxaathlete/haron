class Product < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 6

  belongs_to :product_category
  has_attached_file :product_photo, :styles => {:small => '250x350>', :thumb => "100x100"}


  validates_presence_of :title, :description
 
  validates_uniqueness_of :title

end
