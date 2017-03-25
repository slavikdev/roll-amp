require 'rails'
require 'json'

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

        # Renders tags to connect Google Analytics.
        # @return [String] HTML containing AMP analytics tag with script tag,
        # which configures Google Analytics.
        def amp_google_analytics(account, triggers = {})
          Html::GoogleAnalyticsTag.new(
            Script::JsonScriptTag.new({
              vars: {
                account: account
              },
              triggers: triggers
            }.to_json).to_html
          ).to_html
        end
      end
    end
  end
end
