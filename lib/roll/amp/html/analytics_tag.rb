require 'action_view'

module Roll
  module Amp
    module Html
      # The amp-analytics tag.
      class AnalyticsTag
        include ActionView::Helpers::TagHelper

        # Initializes new instance of the analytics tag.
        # @param type [String] the type of AMP analytics.
        # @param content [String] the content of the tag.
        def initialize(type, content)
          @type = type
          @content = content
        end

        # Prints this tag as HTML.
        # @return [String] HTML-safe string containing the tag's HTML view.
        def to_html
          content_tag('amp-analytics', @content, type: @type)
        end
      end
    end
  end
end
