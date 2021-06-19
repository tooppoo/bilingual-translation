# frozen_string_literal: true

module Translation
  module Model
    # :section: 訳文
    class TargetText
      def initialize(sections:)
        @sections = sections
      end

      class Section
        def initialize(source:, target:)
          @source = source
          @target = target
        end
      end
    end
  end
end
