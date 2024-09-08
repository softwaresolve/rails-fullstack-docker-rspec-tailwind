require 'rails_helper'

RSpec.describe "InspectionComponents", type: :request do
  describe "GET /pdf" do
    it "returns http success" do
      get "/inspection_components/pdf"
      expect(response).to have_http_status(:success)
    end
  end

end
