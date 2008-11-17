
# Avoid Globalize2 attempting to recreate the PageTextTranslation proxy class that we create
# manually in this plugin.
module ::Globalize
  module Model
    module ActiveRecord        
      class << self
        def create_proxy_class(klass)
          if klass != PageText
            Object.const_set "#{klass.name}Translation", Class.new(::ActiveRecord::Base){
              belongs_to "#{klass.name.underscore}".intern
            }
          else
            PageTextTranslation
          end
        end
      end
    end
  end
end
