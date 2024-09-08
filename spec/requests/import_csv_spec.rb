require 'rails_helper'

RSpec.describe "ImportCsvs", type: :request do
  describe "GET /import" do
    it "returns http success" do
      get "/import_csv/import"
      expect(response).to have_http_status(:success)
    end
  end

end
