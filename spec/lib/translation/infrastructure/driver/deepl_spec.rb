# frozen_string_literal: true

require "translation/infrastructure"
require "translation/model"

describe Translation::Infrastructure::Driver::DeepL do
  Model = Translation::Model
  SupportedLang = Model::Language::Supported

  # ローカルでの動作確認用. 外部通信が発生するので、CIでは実行しない.
  xit "translate sample text" do
    auth_key = "REPLACE_BY_YOUR_AUTH_KEY_AT_RUNTIME_AND_MUST_NOT_COMMIT"

    client = Translation::Infrastructure::Driver::DeepL.free_plan(auth_key: auth_key)

    source = Model::SourceText.new([
                                     "Hello, Good Morning.",
                                     "My name is Jiro.",
                                   ])

    sut = client.translate source, from: SupportedLang::English, to: SupportedLang::Japanese
    expected = Model::TargetText.new(sections: [
      Model::TargetText::Section.new(source: "Hello, Good Morning.", target: "こんにちは、おはようございます。"),
      Model::TargetText::Section.new(source: "My name is Jiro.", target: "私の名前はJiroです。"),
    ])

    expect(sut).to eq expected
  end
end
