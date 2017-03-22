require 'action_view'

module Roll
  module Amp
    module Style
      # The boilerplate style tags set. There are two boilerplate styles:
      # the main style and the additional style which disables animations
      # and is put into <noscript> tag.
      # This class represents all that structure.
      class BoilerplateStyleTagsSet
        include ActionView::Helpers::OutputSafetyHelper

        # Builds HTML set of style tags.
        # @return [String] safe HTML string, containing
        # the boilerplate style structure.
        def to_html
          content = BoilerplateStyleTag.new('boilerplate-main.css').to_html
          content << NoScriptTag.new(
            BoilerplateStyleTag.new('boilerplate-animation.css').to_html
          ).to_html
          raw(content)
        end
      end
    end
  end
end
