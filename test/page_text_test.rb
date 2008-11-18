require 'test_helper'
require File.join(File.dirname(__FILE__), "..", "lib", "page_texts_controller")

class PageTextTest < ActiveSupport::TestCase  
  context "Instance created" do
    setup do
      I18n.locale = 'en-US'
      PageText.destroy_all
      @text = PageText.create!(:key => "intro", :body => "Welcome to my website")
    end
    
    should "have a key and a body attributes" do
      @text.reload
      assert_equal "intro", @text.key
      assert_equal "Welcome to my website", @text.body
    end
    
    should "not be valid when key or body is missing" do
      assert @text.valid?
      
      @text.key = nil
      assert !@text.valid?
      assert @text.errors.on(:key)
      
      @text.key = "intro"
      assert @text.valid?

      @text.body = nil
      assert_raise(ActiveRecord::RecordInvalid) do
        assert @text.save
      end
    end
    
    should "require key to be unique" do
      @text2 = PageText.new(:key => "intro", :body => "Welcome!")
      assert !@text2.valid?
      assert @text2.errors.on(:key)
    end
    
    should "be able to create a new version of the body in the same locale" do
      @text.body = "New welcome message"
      @text.save!
      assert_equal "New welcome message", @text.reload.body
      assert_equal 2, @text.translation.versions.size
      assert_equal "Welcome to my website", @text.translation.versions.first.body
      assert_equal "New welcome message", @text.translation.versions.last.body
    end
    
    should "be able to store a different body in a different locale" do
      I18n.locale = 'sv-SE'
      @text.body = "Välkommen till min site"
      @text.save!
      assert_equal "Välkommen till min site", @text.reload.body

      I18n.locale = 'en-US'
      assert_equal "Welcome to my website", @text.body
    end
  end
end
