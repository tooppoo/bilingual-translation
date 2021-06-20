# frozen_string_literal: true

require 'translation/infrastructure'

module Translation
  module Format
    module FormatFactory
      class << self
        include ::WatchMethod

        def use(name)
          send(name)
        end

        def markdown
          watch(
            ::Translation::Infrastructure::Format::Markdown.new,
            about: [:format]
          )
        end
      end
    end
  end
end
