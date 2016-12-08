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
    context "with valid attributes" do
      let(:valid_attributes) {{:amount => 5, :kind => :water, :survivor_id => survivor.id}}
      let(:valid_params) {{format: :json, item: valid_attributes}}
      it "creates the item" do
        post "/survivors/#{survivor.id}/items", valid_params
        expect(response.status).to eq 201

        body = JSON.parse(response.body)
        expect(body['amount']).to eq 5
        expect(body['kind']).to eq "water"
      end
    end

    context "when a item whose kind already exist" do
      let(:new_survivor) { FactoryGirl.create(:survivor)}
      let(:attributes) {{:amount => 15, :kind => :ammo, :survivor_id => new_survivor.id}}
      let(:params) {{format: :json, item: attributes}}
      it "does not allow to create a item" do
        FactoryGirl.create(:item, amount: 10, kind: :ammo, survivor_id: new_survivor.id)
        post "/survivors/#{survivor.id}/items", params
        expect(response.status).to eq 422
      end
    end


  end

  describe "PUT /survivor/survivor:id/item:id" do
    context "with valid attributes" do
      let(:item) { FactoryGirl.create(:item, amount: 10, kind: :ammo, survivor_id: survivor.id)}
      let(:attributes) {{:amount => 15, :kind => :ammo}}
      let(:params) {{format: :json, item: attributes}}
      it "update the item of a given survivor" do
        put "/survivors/#{survivor.id}/items/#{item.id}", params

        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        expect(body['amount']).to eq 15
        expect(body['kind']).to eq "ammo"
      end
    end

    context "when the survivor is a zombie" do
      let(:zombie) { FactoryGirl.create(:survivor, id: 1, name: "Paul", age: 35, gender: :male, is_infected: true, complaints: 2)}
      let(:zombie_item) { FactoryGirl.create(:item, amount: 10, kind: :ammo, survivor_id: zombie.id)}
      let(:attributes) {{:amount => 15, :kind => :ammo, :survivor_id => zombie.id}}
      let(:params) {{format: :json, item: attributes}}
      it "does not allow to update a item" do
        put "/survivors/#{zombie.id}/items/#{zombie_item.id}", params
        expect(response.status).to eq 422
      end
    end

  end

  describe "DELETE /survivor/survivor:id/item:id" do
    context "with valid attributes" do
      let(:item) { FactoryGirl.create(:item, amount: 2, kind: :medicine, survivor_id: survivor.id)}
      it "destroy a item of a given survivor" do
        delete "/survivors/#{survivor.id}/items/#{item.id}"
        expect(response.status).to eq 204
      end
    end

    context "when the survivor is a zombie" do
      let(:zombie) { FactoryGirl.create(:survivor, id: 1, name: "Paul", age: 35, gender: :male, is_infected: true, complaints: 2)}
      let(:zombie_item) { FactoryGirl.create(:item, amount: 10, kind: :ammo, survivor_id: zombie.id)}
      it "does not allow to destroy a item" do
        delete "/survivors/#{zombie.id}/items/#{zombie_item.id}"
        expect(response.status).to eq 422
      end
    end
  end
end
