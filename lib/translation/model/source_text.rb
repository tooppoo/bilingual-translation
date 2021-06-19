# frozen_string_literal: true

module Translation
  module Model
    # :section: 原文
    class SourceText
      # @param [String] text 原文
      # @param [String] new_line 改行記号
      def self.separate_by_new_line(text:, new_line: '\n')
        sentences = text.split new_line

        new sentences
      end

      attr_reader :sentences

      def initialize(sentences)
        @sentences = sentences
      end
    end
  end
end
