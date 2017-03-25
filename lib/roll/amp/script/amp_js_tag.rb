module Roll
  module Amp
    module Script
      # The script tag with AMP main JS file.
      class AmpJsTag < ScriptTag
        def initialize
          super(AmpJsTag.src)
        end

        # Link to main AMP script which must be always included on AMP pages.
        def self.src
          'https://cdn.ampproject.org/v0.js'.freeze
        end
      end
    end
  end
end
