ENV['RAILS_ENV'] = 'test'
require File.join(File.dirname(__FILE__), "rails_root", "config", "environment")
require 'test_help'
require 'shoulda'

require File.join(File.dirname(__FILE__), "..", "lib", "page_texts")
PageTexts.create_tables
ActiveSupport::Dependencies.load_paths << File.join(File.dirname(__FILE__), "..", "lib")
PageTextTranslation.create_versioned_table

class Test::Unit::TestCase
  self.use_transactional_fixtures = true
end
