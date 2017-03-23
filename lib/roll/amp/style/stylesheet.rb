require 'action_view'

module Roll
  module Amp
    module Style
      # The AMP stylesheet which can be loaded from file or assets pipeline
      # and injected into HTML body.
      class Stylesheet
        include ActionView::Helpers::OutputSafetyHelper

        # Initializes new instance of the AML stylesheet.
        # @param app_path [String] the Rails application root path.
        # @param assets [Sprockets::Environment] the Rails.application.assets
        # @param stylesheet_name [String] the stylesheet file name.
        def initialize(app_path, assets, stylesheet_name)
          @app_path = app_path
          @assets = assets
          @stylesheet_name = stylesheet_name
        end

        # Reads stylesheet content from file or assets pipeline.
        # Usually the pipeline is used in dev/test mode, while on production
        # the stylesheet would be read from file.
        # @return [String] CSS content as HTML-safe unescaped string or empty
        # string if content couldn't be retreived.
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
          @assets && @assets[@stylesheet_name]
        end

        def read_from_pipeline
          @assets[@stylesheet_name]
        end

        def read_from_compiled_file
          CompiledStylesheetFile.new(@app_path, @stylesheet_name).read
        end
      end
    end
  end
end
