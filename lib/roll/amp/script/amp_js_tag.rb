module Roll
  module Amp
    module Script
      # The script tag with AMP main JS file.
      class AmpJsTag < IncludeScriptTag
        # Initializes new instance of the AMP script tag.
        def initialize
          super(AmpJsTag.src)
        end

        # @return [String] Link to main AMP script which
        # must be always included on AMP pages.
        def self.src
          'https://cdn.ampproject.org/v0.js'.freeze
        end
      end
    end
  end
end
