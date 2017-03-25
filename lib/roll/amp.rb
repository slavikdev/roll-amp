require 'roll/amp/version'
require 'roll/amp/autoload'
require 'action_view'

module Roll
  # AMP in Rails apps.
  module Amp
    # CSS in AMP.
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
    end

    # JS in AMP.
    module Script
      use :AnalyticsScriptTag,     'script/analytics_script_tag'
      use :AmpJsTag,               'script/amp_js_tag'
      use :IncludeScriptTag,       'script/include_script_tag'
      use :ScriptTag,              'script/script_tag'
    end

    # HTML in AMP.
    module Html
      use :AnalyticsTag, 'html/analytics_tag'
    end

    # Modules with utility functions to use in Rails helpers.
    module Helpers
      use :Tags, 'helpers/tags'
    end
  end
end

# Automatically extend Rails views with AMP tags.
ActionView::Base.send :include, Roll::Amp::Helpers::Tags
