class PageText < ActiveRecord::Base
  validates_presence_of :key
  validates_uniqueness_of :key
  
  translates :body, :proxy_class => PageTextTranslation

  def self.create_tables
    connection.create_table("page_texts") do |t|
      t.string :key, :null => false, :unique => true
      t.timestamps      
    end

    connection.create_table("page_text_translations") do |t|
      t.integer :page_text_id, :on_delete => :cascade
      t.text :body
      t.string :locale, :null => false
      t.timestamps
    end
  end
end
