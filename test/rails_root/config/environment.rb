# Specifies gem version of Rails to use when vendor/rails is not present
old_verbose, $VERBOSE = $VERBOSE, nil
RAILS_GEM_VERSION = '>= 2.2.1' unless defined? RAILS_GEM_VERSION
$VERBOSE = old_verbose

SESSION_SECRET = 'f3ca0425572651c03f1943b748430bfa'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.log_level = :debug
  config.cache_classes = false
  config.whiny_nils = true

  config.action_controller.session = {
    :session_key => '_page_texts_session',
    :secret      => SESSION_SECRET
  }
end
