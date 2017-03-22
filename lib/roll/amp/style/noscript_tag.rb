require 'action_view'

module Roll
  module Amp
    module Style
      # The <nosript> tag.
      class NoScriptTag
        include ActionView::Helpers::TagHelper

        # Initializes new instance of the noscript tag.
        # @param [String] the content of the tag.
        def initialize(content)
          @content = content
        end

        # Prints this tag as HTML.
        # @return [String] HTML-safe string containing the tag's HTML view.
        def to_html
          content_tag('noscript', @content)
        end
      end
    end
  end
end
