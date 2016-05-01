require 'rails_helper'

RSpec.describe Api::SeriesController, type: :controller do
  let!(:series) { create(:series) }
  context 'get #index' do
    it "should get the page" do
      get :index, format: :json

      expect(response).to have_http_status :ok
    end

    it "should serialize some series" do
      get :index, format: :json

      expect(json_response.dig("series", 0, "name")).to eq series.name
    end
  end
end
