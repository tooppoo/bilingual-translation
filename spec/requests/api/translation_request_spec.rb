require 'rails_helper'

RSpec.describe "Api::Translations", type: :request do

  describe "POST /translate" do
    it "returns http success" do
      post "/api/translation"
      expect(response).to have_http_status(:success)
    end
    it "returns json" do
      post "/api/translation"

      expect(response.content_type).to include "application/json"
    end
  end

end
