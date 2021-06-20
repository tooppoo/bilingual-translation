# frozen_string_literal: true

require 'translation/infrastructure'

module Translation
  module Format
    module FormatFactory
      class << self

        def use(name)
          send(name)
        end

        def markdown
          ::Translation::Infrastructure::Format::Markdown.new
        end
      end
    end
  end
end
