module Roll
  module Amp
    module Script
      # The script tag that enables analytics on AMP pages.
      class AnalyticsScriptTag < ScriptTag
        # Initializes analytics script tag instance.
        def initialize
          super(AnalyticsScriptTag.src, 'amp-analytics')
        end

        # Link to the script.
        def self.src
          'https://cdn.ampproject.org/v0/amp-analytics-0.1.js'.freeze
        end
      end
    end
  end
end
