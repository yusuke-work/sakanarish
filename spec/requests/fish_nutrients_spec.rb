require 'rails_helper'

RSpec.describe "FishNutrients", type: :request do
  describe "GET /result" do
    it "returns http success" do
      get "/fish_nutrients/result"
      expect(response).to have_http_status(:success)
    end
  end

end
