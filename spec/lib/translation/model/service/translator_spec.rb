# frozen_string_literal: true

require "translation/model"

Model = Translation::Model
describe Model::Service::Translator do
  let(:src_txt) { Model::SourceText.new(%w[text1 text2]) }
  let(:driver) do
    driver_mock = double("driver")
    expect(driver_mock).to receive("translate").with(src_txt, from: src_lang, to: target_lang) do |src|
      source_sentences = src.sentences

      Model::TargetText.new(sections: [
        Model::TargetText::Section.new(source: source_sentences[0], target: "文書1"),
        Model::TargetText::Section.new(source: source_sentences[1], target: "文書2"),
      ])
    end

    driver_mock
  end

  let(:formatter) do
    Struct.new("MockFormatter") do
      def format(source:, target:)
        "#{source} -> #{target}"
      end
    end
  end

  subject(:run_translator_service) do
    sut = Model::Service::Translator.new(driver: driver)
    input = Model::Service::Translator::Input.new(
      source: src_txt,
      language_pair: Model::Language::LanguagePair.new(source: src_lang, target: target_lang),
      formatter: formatter.new
    )

    sut.run(input)
  end

  context "language is supported" do
    let(:src_lang) { Model::Language::Supported::English }
    let(:target_lang) { Model::Language::Supported::Japanese }

    it { is_expected.to eq "text1 -> 文書1\ntext2 -> 文書2" }
  end
end
