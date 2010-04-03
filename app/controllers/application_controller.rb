# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include AuthenticatedSystem
  acts_as_captcha

  before_filter :find_categories_for_slide
  before_filter :load_meny
  WillPaginate::ViewHelpers.pagination_options[:previous_label] = "Предыдущая"
  WillPaginate::ViewHelpers.pagination_options[:next_label] = "Следующая"
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def load_meny
    @meny_items = MenyItem.all
  end

  def find_categories_for_slide
    @categories = ProductCategory.by_show_slide
  end



end