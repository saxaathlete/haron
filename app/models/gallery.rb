class Gallery < ActiveRecord::Base
  has_attached_file :gallery_photo, :styles => {:small => '730x490', :thumb => "100x100#"}

  validates_presence_of :title
end
