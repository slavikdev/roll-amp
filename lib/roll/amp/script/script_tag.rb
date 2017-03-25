require 'action_view'

module Roll
  module Amp
    module Script
      # The script tag for embedded scripts.
      class ScriptTag
        include ActionView::Helpers::TagHelper
        include ActionView::Helpers::OutputSafetyHelper

        # Initializes new instance of the script tag.
        # @param type [String] the MIME type of the script.
        # @param content [String] the script's content.
        def initialize(type, content)
          @type = type
          @content = content
        end

        # Prints this tag as HTML.
        # @return [String] HTML-safe string containing the tag's HTML view.
        def to_html
          content_tag('script', raw(@content), type: @type)
        end
      end
    end
  end
end
