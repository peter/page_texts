class PageText < ActiveRecord::Base
  validates_presence_of :key
  validates_uniqueness_of :key
  
  translates :body

  before_destroy :destroy_all_translations
  
  def translation
    globalize_translations.find_by_locale(I18n.locale)
  end

  def reload
    @globalize = nil
    super
  end
  
  private
    def destroy_all_translations
      globalize_translations.destroy_all
    end
end
