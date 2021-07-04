
require 'translation/model'

class Api::TranslationController < ApplicationController
  protect_from_forgery except: :translate

  def translate
    formatter = Translation::Format::FormatFactory.use(
      Rails.configuration.x.translation.format[:default]
    )
    driver = Translation::Driver::DriverFactory.use(
      Rails.configuration.x.translation.driver[:default]
    )

    service = Translation::Model::Service::Translator.new(driver: driver)

    parameter = translate_params
    input = Translation::Model::Service::Translator::Input.new(
      source: Translation::Model::SourceText.new(parameter[:text]),
      language_pair: Translation::Model::Language::LanguagePair.new(
        source: parameter[:language][:from],
        target: parameter[:language][:to]
      ),
      formatter: formatter
    )

    translated = service.run(input)

    @translated = Translated.new(body: translated)
  end

  # @example
  # {
  #   text: ["a", "b", "c"],
  #   language: {
  #     from: "en",
  #     to: "ja",
  #   }
  # }
  private def translate_params
    {
      text: params.require(:text),
      language: params.require(:language).permit(:from, :to)
    }
  end
end
