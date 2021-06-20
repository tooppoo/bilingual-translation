# frozen_string_literal: true

module Translation
  module Model
    module Language
      class UnsupportedError < RuntimeError; end

      module Supported
        English = "EN"
        Japanese = "JA"
      end

      class LanguagePair
        attr_reader :source, :target

        # @param source ソース言語
        # @param target ターゲット言語
        def initialize(source:, target:)
          @source = source
          @target = target
        end
      end
    end
  end
end
