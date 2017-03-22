module Roll
  module Amp
    module Style
      # The internal CSS file. Provides API to access preset
      # CSS files of this library.
      class InternalCssFile
        # Initializes new instance of the internal CSS file.
        # @param css_file_name [String] the file name of the CSS file.
        def initialize(css_file_name)
          @css_file_name = css_file_name
        end

        # Reads content of the file.
        # @return [String] the file content.
        def read
          File.read(full_path)
        end

        private

        def full_path
          File.expand_path(
            "../style/css/#{@css_file_name}",
            File.dirname(__FILE__)
          )
        end
      end
    end
  end
end
