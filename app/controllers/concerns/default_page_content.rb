module DefaultPageContent
   extend ActiveSupport::Concern
  
  included do
    before_filter :set_page_defaults
  end
  
  def set_page_defaults
    @page_title = "Devcamp Portfolio | Ripken's Portfolio Website"
    @seo_keywords = "Ripken Urry Portfolio"
  end
end


  
  
