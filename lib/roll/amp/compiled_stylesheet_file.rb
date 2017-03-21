require 'action_view'

module Roll
  module Amp
    # The stylesheet file, compiled into Rails app public directory.
    class CompiledStylesheetFile
      # Initializes new instance of the compiled stylesheet file.
      #   @param [String] app_path Rails application root path.
      #   @param [String] stylesheet_name stylesheet file name.
      def initialize(app_path, stylesheet_name)
        @app_path = app_path
        @stylesheet_name = stylesheet_name
      end

      # Reads content of the file. Returns empty string if file doesn't exist.
      def read
        full_stylesheet_path = full_path
        if File.file?(full_stylesheet_path) && File.exist?(full_stylesheet_path)
          File.read(full_stylesheet_path)
        else
          ''
        end
      end

      private

      # Returns full path of the stylesheet in the public directory.
      def full_path
        stylesheet_file = ActionView::Base.new.stylesheet_path(
          @stylesheet_name,
          host: nil
        )
        "#{@app_path}/public#{stylesheet_file}"
      end
    end
  end
end
