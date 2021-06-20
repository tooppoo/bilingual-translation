
require 'translation/model'

class Api::TranslationController < ApplicationController
  def translate
    formatter = Translation::Format::FormatFactory.use(
      Rails.configuration.x.translation.format[:default]
    )
    driver = Translation::Driver::DriverFactory.use(
      Rails.configuration.x.translation.driver[:default]
    )

    service = Translation::Model::Service::Translator.new(driver: driver)

    input = Translation::Model::Service::Translator::Input.new(
      source: Translation::Model::SourceText.new(translate_params[:text]),
      language_pair: Translation::Model::Language::LanguagePair.new(
        source: translate_params[:language][:from],
        target: translate_params[:language][:to]
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
    params.tap do |p|
      p.permit(text: [])
      p.require(:language).permit(:from, :to)
    end
  end
end
