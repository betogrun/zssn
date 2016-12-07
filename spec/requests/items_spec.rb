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
    let(:valid_attributes) {{:amount => 5, :kind => :water, :survivor_id => survivor.id}}
    let(:valid_params) {{format: :json, item: valid_attributes}}

    it "creates the item" do
      post "/survivors/#{survivor.id}/items", valid_params
      expect(response.status).to eq 201

      body = JSON.parse(response.body)
      expect(body['amount']).to eq 5
      expect(body['kind']).to eq "water"
    end

    let(:new_survivor) { FactoryGirl.create(:survivor)}
    let(:attributes) {{:amount => 15, :kind => :ammo, :survivor_id => new_survivor.id}}
    let(:params) {{format: :json, item: attributes}}
    it "does not allow to create a item whose kind already exists" do
      FactoryGirl.create(:item, amount: 10, kind: :ammo, survivor_id: new_survivor.id)
      post "/survivors/#{survivor.id}/items", params
      expect(response.status).to eq 422
    end

  end


end
