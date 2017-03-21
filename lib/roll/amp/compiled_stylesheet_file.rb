require 'rails'
require 'action_view'

module Roll
  module Amp
    # The stylesheet file, compiled into Rails app public directory.
    class CompiledStylesheetFile
      # Initializes new instance of the compiled stylesheet file.
      #   @param [String] stylesheet_name stylesheet file name.
      def initialize(stylesheet_name)
        @stylesheet_name = stylesheet_name
      end

      # Reads content of the file. Returns empty string if file doesn't exist.
      def read
        file_path = full_path
        if File.file?(file_path) && File.exist?(file_path)
          File.read(file_path)
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
        "#{Rails.root}/public#{stylesheet_file}"
      end
    end
  end
end
