# frozen_string_literal: true

module Translation
  module Model
    module Language
      module Supported
        English = "EN"
        Japanese = "JA"
      end

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
end
