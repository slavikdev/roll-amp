require 'rails'

module Roll
  module Amp
    module Style
      module Helpers
        # Implements tags to be used in Rails templates.
        module Tags
          # Renders AMP boilerplate stylesheet.
          # @return [String] HTML containing style tags with boilerplate CSS.
          def amp_boilerplate
            BoilerplateStyleTagsSet.new.to_html
          end

          # Renders custom stylesheet.
          # @return [String] HTML containing style tag with
          # content of the file specified.
          def amp_custom_style(file_name)
            CustomStyleTag.new(
              Stylesheet.new(
                Rails.root,
                Rails.application.assets,
                file_name
              ).read
            ).to_html
          end
        end
      end
    end
  end
end
