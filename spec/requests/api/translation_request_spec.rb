require 'rails_helper'

RSpec.describe "Api::Translations", type: :request do
  describe "POST /translate" do
    context "request parameter valid" do
      let(:params) do
        {
          text: ["hello", "my name is john"],
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
