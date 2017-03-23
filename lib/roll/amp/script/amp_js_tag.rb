require 'action_view'

module Roll
  module Amp
    module Script
      # The script tag with AMP utilities.
      class AmpJsTag
        include ActionView::Helpers::OutputSafetyHelper

        # Prints this tag as HTML.
        # @return [String] HTML-safe string containing the tag's HTML view.
        def to_html
          raw('<script async src="https://cdn.ampproject.org/v0.js"></script>')
        end
      end
    end
  end
end
