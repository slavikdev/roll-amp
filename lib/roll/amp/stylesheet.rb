require 'action_view'

module Roll
  module Amp
    # The AMP stylesheet which can be loaded from file or assets pipeline
    # and injected into HTML body.
    class Stylesheet
      # Initializes new instance of the AML stylesheet.
      #   @param [Array] assets Rails.application.assets collection.
      #   @param [String] stylesheet_name stylesheet file name.
      def initialize(assets, stylesheet_name)
        @assets = assets
        @stylesheet_name = stylesheet_name
      end

      # Reads stylesheet content from file or assets pipeline.
      # Usually the pipeline is used in dev/test mode, while on production
      # the stylesheet would be read from file.
      # @return [String] CSS content as HTML-safe unescaped string.
      def read
        raw(stylesheet_content)
      end

      private

      def stylesheet_content
        if available_in_pipeline?
          read_from_pipeline
        else
          read_from_compiled_file
        end
      end

      def available_in_pipeline?
        @assets && @assets.key?(@stylesheet_name)
      end

      def read_from_pipeline
        @assets[@stylesheet_name]
      end

      def read_from_compiled_file
        CompiledStylesheetFile.new(@stylesheet_name).read
      end
    end
  end
end
