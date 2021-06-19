# frozen_string_literal: true

require "translation/model"

Model = Translation::Model
describe Model::Service::Translator do
  it "should translate text as set of source and target languages" do
    src_txt = Model::SourceText.new(%w[text1 text2])
    src_lang = Model::Language::Supported::English
    target_lang = Model::Language::Supported::Japanese

    driver_mock = double("driver")
    expect(driver_mock).to receive("translate").with(src_txt, from: src_lang, to: target_lang) do |src|
      source_sentences = src.sentences

      Model::TargetText.new(sections: [
        Model::TargetText::Section.new(source: source_sentences[0], target: "文書1"),
        Model::TargetText::Section.new(source: source_sentences[1], target: "文書2"),
      ])
    end

    formatter = Struct.new("MockFormatter") do
      def format(source:, target:)
        "#{source} -> #{target}"
      end
    end

    sut = Model::Service::Translator.new(driver: driver_mock)
    input = Model::Service::Translator::Input.new(
      source: src_txt,
      language_pair: Model::Language::LanguagePair.new(source: src_lang, target: target_lang),
      formatter: formatter.new
    )

    expect(sut.run(input)).to eq "text1 -> 文書1\ntext2 -> 文書2"
  end
end
