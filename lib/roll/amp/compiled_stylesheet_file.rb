module Roll
  module Amp
    # The stylesheet file, compiled into Rails app public directory.
    class CompiledStylesheetFile
      # Initializes new instance of the compiled stylesheet file.
      #   @param [String] app_path Rails application root path.
      #   @param [String] stylesheet_name stylesheet file name.
      def initialize(app_path, stylesheet_name)
        @path = CompiledStylesheetPath.new(app_path, stylesheet_name)
      end

      # Reads content of the file. Returns empty string if file doesn't exist.
      def read
        full_stylesheet_path = @path.full
        if File.file?(full_stylesheet_path) && File.exist?(full_stylesheet_path)
          File.read(full_stylesheet_path)
        else
          ''
        end
      end
    end
  end
end
