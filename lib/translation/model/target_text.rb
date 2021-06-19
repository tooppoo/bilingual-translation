# frozen_string_literal: true

module Translation
  module Model
    # :section: 訳文
    class TargetText
      attr_reader :sections

      def initialize(sections:)
        @sections = sections
      end

      def ==(other)
        @sections == other.sections
      end

      def format(by:)
        formatter = by

        formatted_sections = @sections.map do |sec|
          formatter.format source: sec.source, target: sec.target
        end

        formatted_sections.join "\n"
      end

      class Section
        attr_reader :source, :target

        def initialize(source:, target:)
          @source = source
          @target = target
        end

        def ==(other)
          @source == other.source && @target == other.target
        end
      end
    end
  end
end
