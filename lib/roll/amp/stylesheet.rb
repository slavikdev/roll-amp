module Roll
  module Amp
    class Stylesheet
      def initialize(assets, stylesheet_name)
        @assets = assets
        @stylesheet_name = stylesheet_name
      end

      def read
        content = if @assets
                    @assets[@stylesheet_name]
                  else
                    RailsStylesheetFile.new(@stylesheet_name).read
                  end
        raw content
      end
    end
  end
end
