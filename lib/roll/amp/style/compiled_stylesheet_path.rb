require 'action_view'

module Roll
  module Amp
    module Style
      # The path of a stylesheet file, compiled into
      # Rails app `public` directory.
      class CompiledStylesheetPath
        # Initializes new instance of the path of a compiled stylesheet file.
        # @param app_path [String] the Rails application root path.
        # @param stylesheet_name [String] the stylesheet file name.
        def initialize(app_path, stylesheet_name)
          @app_path = app_path
          @stylesheet_name = stylesheet_name
        end

        # Uses ActionView to obtain full stylesheet path in `public` directory.
        # @return [String] the full path string. Always has value.
        def full
          stylesheet_file = ActionView::Base.new.stylesheet_path(
            @stylesheet_name,
            host: nil
          )
          "#{@app_path}/public#{stylesheet_file}"
        end
      end
    end
  end
end
