module PageTexts
  mattr_accessor :locales
  self.locales = ["en-US", "sv-SE"]

  def self.create_tables
    connection = ActiveRecord::Base.connection

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

require File.join(File.dirname(__FILE__), 'globalize2_patch')
