ENV['RAILS_ENV'] = 'test'
require File.join(File.dirname(__FILE__), "rails_root", "config", "environment")
require File.join(File.dirname(__FILE__), "..", "lib", "page_texts")

require 'test_help'
require 'shoulda'

PageTexts.create_tables
