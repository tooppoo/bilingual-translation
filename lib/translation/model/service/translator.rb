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

          unsupported = language_pair.select do |lang|
            (Language::Supported.contains? lang) == false
          end
          raise Language::UnsupportedError.because(unsupported) unless unsupported.empty?

          translated = @driver.translate(source, from: language_pair.source, to: language_pair.target)

          translated.format by: input.formatter
        end

        Input = Struct.new(:source, :language_pair, :formatter, keyword_init: true)

        private

        Language = Translation::Model::Language
      end
    end
  end
end
