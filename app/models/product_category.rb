class ProductCategory < ActiveRecord::Base

  module Type
    MONUMENTS = "Monuments"
    FUNERALS = "Funerals"

    ALL = [MONUMENTS, FUNERALS]
  end
  has_attached_file :category_photo, :styles => {:small => '100x120'}
  has_many :products, :dependent => :delete_all

  has_many :sub_categories, :class_name => "ProductCategory", :foreign_key => "parent_id", :order => "category_name ASC", :dependent => :delete_all
  belongs_to :parent_category, :class_name => "ProductCategory", :foreign_key => "parent_id"

  validates_presence_of :category_name, :description
  validates_uniqueness_of :category_name

  named_scope :by_monuments, lambda {
    {:conditions => ["category_type = ?", Type::MONUMENTS ]}
  }
  named_scope :by_funerals, lambda {
    {:conditions => ["category_type = ?", Type::FUNERALS ]}
  }
  named_scope :by_parent_id, lambda {|parent_id|
    {:conditions => ['parent_id = ?', (parent_id.blank? ? 0 : parent_id.to_i) ] }
  }
  named_scope :by_show_slide, lambda {
    {:conditions => ["show_slide = ?", true ]}
  }
  def all_sub_categories_ids( category = self )
    (category.sub_categories.map{|c| all_sub_categories_ids( c ) } + [category.id]).flatten
  end

  def find_all_products_by_sub_categories_ids(category = self)
    Product.find(:all, :conditions => ["product_category_id IN(?)", category.all_sub_categories_ids])
  end
  

  def subcategories cat = self
    tree = []
    unless cat.sub_categories.blank?
      cat.sub_categories.each do |c|
        tree << { :attributes => { :id => c.id },
          :data => { :title => %Q!<font class='bottom_node'>#{c.category_name}</font>! },
          :state => c.sub_categories.blank? ? "" : "closed",
          :children => c.subcategories
        }
      end
    end
    tree
  end

  def self.monuments_tree
    ProductCategory.tree ProductCategory.by_parent_id(0).by_monuments.all
  end

  def self.funerals_tree
    ProductCategory.tree ProductCategory.by_parent_id(0).by_funerals.all
  end

  def self.tree categories
    tree = []
    unless categories.blank?
      categories.each do |c|
        tree << { :attributes => { :id => c.id, :rel => 'root' },
          :data => { :title => %Q!<b class='top_node'>#{c.category_name}</b>! },
          :state => c.sub_categories.blank? ? "" : "open",
          :children => c.subcategories
        }
      end
    end
    tree
  end

end
