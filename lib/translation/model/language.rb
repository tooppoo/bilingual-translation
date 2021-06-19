# frozen_string_literal: true

module Translation
  module Language
    class LanguagePair
      attr_reader :source, :target

      # @param [Symbol] source ソース言語
      # @param [Symbol] target ターゲット言語
      def initialize(source:, target:)
        @source = source
        @target = target
      end
    end
  end
end
