require 'rails_helper'

require 'translation/model'

module Translation::Factory::DriverFactory
  def self.test
    TestDriver.new
  end

  class TestDriver
    def translate(source, from:, to:)
      source_sentences = source.sentences

      Translation::Model::TargetText.new(sections: [
        Translation::Model::TargetText::Section.new(source: source_sentences[0], target: "文書1"),
        Translation::Model::TargetText::Section.new(source: source_sentences[1], target: "文書2"),
      ])
    end
  end
end

RSpec.describe "Api::Translations", type: :request do
  Rails.configuration.x.translation.driver = { default: :test }

  describe "POST /translate" do
    context "request parameter valid" do
      let(:params) do
        {
          text: %w[text1 text2],
          language: {
            from: "en",
            to: "ja",
          },
        }
      end
      it "returns http success" do
        post "/api/translation", xhr: true, params: params

        expect(response).to have_http_status(:success)
      end
      it "returns json" do
        post "/api/translation", xhr: true, params: params

        expect(response.content_type).to include "application/json"
      end
    end
  end
end
