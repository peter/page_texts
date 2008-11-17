class PageText < ActiveRecord::Base
  validates_presence_of :key
  validates_uniqueness_of :key
  
  translates :body
  
  def translation
    globalize_translations.find_by_locale(I18n.locale)
  end
end
