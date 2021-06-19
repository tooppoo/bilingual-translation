# frozen_string_literal: true

module Translation
  module Model
    module Service
      class Translator
        def initialize(driver:)
          @driver = driver
        end

        def run(input)
          source = input.source
          language_pair = input.language_pair

          translated = @driver.translate(source, from: language_pair.source, to: language_pair.target)

          translated.format by: input.formatter
        end

        Input = Struct.new(:source, :language_pair, :formatter, keyword_init: true)
      end
    end
  end
end
