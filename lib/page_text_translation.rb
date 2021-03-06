class PageTextTranslation < ActiveRecord::Base
  belongs_to :page_text

  validates_uniqueness_of :locale, :scope => [:page_text_id]
  validates_presence_of :body

  acts_as_versioned :non_versioned_columns => [:page_text_id, :locale]

  before_destroy :destroy_all_versions
  
  private
    def destroy_all_versions
      versions.destroy_all
    end
end
