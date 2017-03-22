require 'action_view'

module Roll
  module Amp
    module Style
      # The style tag.
      class StyleTag
        include ActionView::Helpers::TagHelper

        # Initializes new instance of the style tag.
        # @param amp_attr [String] the AMP-specific attribute of the tag
        # to indicate its purpose.
        # @param [String] the content of the tag.
        def initialize(amp_attr, content)
          @amp_attr = amp_attr
          @content = content
        end

        # Prints this tag as HTML.
        # @return [String] HTML-safe string containing the tag's HTML view.
        def to_html
          content_tag('style', @content, @amp_attr => '')
        end
      end
    end
  end
end
