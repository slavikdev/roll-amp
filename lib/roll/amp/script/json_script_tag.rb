module Roll
  module Amp
    module Script
      # The script tag that contains JSON.
      class JsonScriptTag < ScriptTag
        # Initializes script tag instance.
        # @param content [String] the content of the tag.
        def initialize(content)
          super(JsonScriptTag.type, content)
        end

        # @return [String] JSON MIME type.
        def self.type
          'application/json'.freeze
        end
      end
    end
  end
end
