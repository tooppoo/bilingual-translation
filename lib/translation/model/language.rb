# frozen_string_literal: true

module Translation
  module Model
    module Language
      class UnsupportedError < RuntimeError;
        def self.because(unsupported)
          messages = "unsupported languages = #{unsupported.join(', ')}"

          new messages
        end
      end

      module Supported
        English = "EN"
        Japanese = "JA"

        def self.contains?(lang)
          constants.any? do |supported|
            const_get(supported) == lang
          end
        end
      end

      class LanguagePair
        attr_reader :source, :target

        # @param source ソース言語
        # @param target ターゲット言語
        def initialize(source:, target:)
          @source = source
          @target = target
        end

        def select
          [@source, @target].select do |lang|
            yield lang
          end
        end
      end
    end
  end
end
