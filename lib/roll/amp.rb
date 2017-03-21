require 'roll/amp/version'

module Roll
  # APIs to simplify AMP implementation in Rails apps.
  module Amp
    autoload :Stylesheet, 'roll/amp/stylesheet'
    autoload :CompiledStylesheetFile, 'roll/amp/compiled_stylesheet_file'
  end
end
