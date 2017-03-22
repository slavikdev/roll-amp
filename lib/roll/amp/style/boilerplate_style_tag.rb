module Roll
  module Amp
    module Style
      # The boilerplate style tag. Provides base CSS for AMP pages.
      class BoilerplateStyleTag < StyleTag
        # Initializes new instance of the boilerplate style tag.
        # @param css_file_name [String] the file name of the CSS file to take
        # boilerplate CSS content from.
        def initialize(css_file_name)
          super(
            'amp-boilerplate',
            InternalCssFile.new(css_file_name).read
          )
        end
      end
    end
  end
end
