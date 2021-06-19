# frozen_string_literal: true

module Translation
  module Model
    module Service
      class Translator
        def initialize(driver:, formatter:)
          @driver = driver
          @formatter = formatter
        end

        def run(input)
          source = input.source
          language_pair = input.language_pair

          translated = @driver.translate(source, from: language_pair.source, to: language_pair.target)

          @formatter.format(translated)
        end
      end
    end
  end
end
