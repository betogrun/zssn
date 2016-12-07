require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:survivor) { FactoryGirl.create(:survivor)}

  describe "GET /survivors/survivor:id/items" do
    it "show the items that belongs to a survivor" do
      get "/survivors/#{survivor.id}/items"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /survivors/survivor:id/items" do
    let(:attributes) {{:amount => 5, :kind => :water, :survivor_id => survivor.id}}
    let(:params) {{format: :json, item: attributes}}

    it "creates the item" do
      puts params
      post "/survivors/#{survivor.id}/items", params
      expect(response.status).to eq 201

      body = JSON.parse(response.body)
      expect(body['amount']).to eq 5
      expect(body['kind']).to eq "water"
    end
  end

end
