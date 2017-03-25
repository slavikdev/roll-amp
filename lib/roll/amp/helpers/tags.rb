require 'rails'

module Roll
  module Amp
    module Helpers
      # Implements tags to be used in Rails templates.
      module Tags
        # Renders AMP boilerplate stylesheet.
        # @return [String] HTML containing style tags with boilerplate CSS.
        def amp_boilerplate
          Style::BoilerplateStyleTagsSet.new.to_html
        end

        # Renders custom stylesheet.
        # @return [String] HTML containing style tag with
        # content of the file specified.
        def amp_custom_style(file_name)
          Style::CustomStyleTag.new(
            Style::Stylesheet.new(
              ::Rails.root,
              ::Rails.application.assets,
              file_name
            ).read
          ).to_html
        end

        # Renders script tag with link to AMP main JS.
        # @return [String] HTML containing script tag.
        def amp_js
          Script::AmpJsTag.new.to_html
        end

        # Renders script tag with link to AMP analytics JS.
        # @return [String] HTML containing script tag.
        def amp_analytics_js
          Script::AnalyticsScriptTag.new.to_html
        end
      end
    end
  end
end
