class Article < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 6

  validates_presence_of :title, :article

  CATEGORIES = ["Новости", "Ритуальные услуги", "Памятники"]
  
  named_scope :by_news, lambda {
    {:conditions => ["directory = ?", "Новости" ]}
  }
  named_scope :by_funerals, lambda {
    {:conditions => ["directory = ?", "Ритуальные услуги" ]}
  }
  named_scope :by_monuments, lambda {
    {:conditions => ["directory = ?", "Памятники" ]}
  }

  def description
    description = self.article.split("</p>").first + "</p>"
    p description
    unless description.size < 500
      description
    else
      description[0..500]
    end

  end
end
