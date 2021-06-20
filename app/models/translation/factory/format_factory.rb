# frozen_string_literal: true

module Translation
  module Factory
    module FormatFactory
      class << self
        require 'translation/infrastructure'

        def use(name)
          send(name)
        end

        def markdown
          Translation::Infrastructure::Format::Markdown.new
        end
      end
    end
  end
end
