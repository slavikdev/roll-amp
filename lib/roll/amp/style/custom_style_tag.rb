module Roll
  module Amp
    module Style
      # The custom style tag.
      class CustomStyleTag < StyleTag
        # Initializes new instance of the custom style tag.
        # @param [String] the content of the tag.
        def initialize(content)
          super('amp-custom', content)
        end
      end
    end
  end
end
