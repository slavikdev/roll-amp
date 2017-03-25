module Roll
  module Amp
    module Html
      # The amp-analytics tag for Google Analytics.
      class GoogleAnalyticsTag < AnalyticsTag
        # Initializes new instance of the analytics tag.
        # @param content [String] the content of the tag.
        def initialize(content)
          super(GoogleAnalyticsTag.type, content)
        end

        def self.type
          'googleanalytics'.freeze
        end
      end
    end
  end
end
