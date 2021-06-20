# frozen_string_literal: true

module Translation
  module Model
    # :section: 原文
    class SourceText
      attr_reader :sentences

      def initialize(sentences)
        @sentences = sentences
      end
    end
  end
end
