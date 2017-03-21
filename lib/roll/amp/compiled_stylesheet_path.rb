require 'action_view'

module Roll
  module Amp
    # The path of a stylesheet file, compiled into Rails app public directory.
    class CompiledStylesheetPath
      # Initializes new instance of the path of a compiled stylesheet file.
      #   @param [String] app_path Rails application root path.
      #   @param [String] stylesheet_name stylesheet file name.
      def initialize(app_path, stylesheet_name)
        @app_path = app_path
        @stylesheet_name = stylesheet_name
      end

      # Returns full path of the stylesheet in the public directory.
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
