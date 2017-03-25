require 'action_view'

module Roll
  module Amp
    module Script
      # The script tag to include AMP scripts. Note, it's always async.
      class IncludeScriptTag
        include ActionView::Helpers::OutputSafetyHelper

        # Initializes new instance of the include script tag.
        # @param src [String] the URL to the script.
        # @param custom_element [String] the custom-element attribute value.
        def initialize(src, custom_element = '')
          @src = src
          @custom_element = custom_element
        end

        # Prints this tag as HTML.
        # @return [String] HTML-safe string containing the tag's HTML view.
        def to_html
          if @custom_element.empty?
            raw("<script async src=\"#{@src}\"></script>")
          else
            raw(
              "<script async src=\"#{@src}\" " \
              "custom-element=\"#{@custom_element}\"></script>"
            )
          end
        end
      end
    end
  end
end
