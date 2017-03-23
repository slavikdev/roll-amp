require 'roll/amp/version'
require 'roll/amp/autoload'
require 'action_view'

module Roll
  # APIs to simplify AMP implementation in Rails apps.
  module Amp
    # APIs related to CSS in AMP.
    module Style
      use :BoilerplateStyleTag,      'style/boilerplate_style_tag'
      use :BoilerplateStyleTagsSet,  'style/boilerplate_style_tags_set'
      use :CompiledStylesheetFile,   'style/compiled_stylesheet_file'
      use :CompiledStylesheetPath,   'style/compiled_stylesheet_path'
      use :CustomStyleTag,           'style/custom_style_tag'
      use :InternalCssFile,          'style/internal_css_file'
      use :NoScriptTag,              'style/noscript_tag'
      use :StyleTag,                 'style/style_tag'
      use :Stylesheet,               'style/stylesheet'

      # Modules with utility functions to use in Rails helpers.
      module Helpers
        use :Tags, 'style/helpers/tags'
      end
    end
  end
end

# Automatically extend Rails views with AMP tags.
ActionView::Base.send :include, Roll::Amp::Style::Helpers::Tags
