class PageTextTranslation < ActiveRecord::Base
  belongs_to :page_text

  validates_uniqueness_of :locale, :scope => [:page_text_id]

  acts_as_versioned :non_versioned_columns => [:page_text_id, :locale]
end
