require 'rails_helper'

RSpec.describe "Survivors", type: :request do

  describe "GET /survivors" do
    it "works! (now write some real specs)" do
      get survivors_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /survivors" do
    context "with valid parameters" do
      let(:valid_attributes) {{:name => "Jonh", :age => 24, :gender => :male, :is_infected => false, :complaints => 0}}
      let(:valid_params) {{format: :json, survivor: valid_attributes}}


      it "creates the survivor" do
        post "/survivors", valid_params

        expect(response.status).to eq 201

        body = JSON.parse(response.body)
        expect(body['name']).to eq "Jonh"
        expect(body['age']).to eq 24
        expect(body['gender']).to eq "male"
        expect(body['is_infected']).to eq false
        expect(body['complaints']).to eq 0
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) {}
      let(:invalid_params) {{format: :json, survivor: invalid_attributes}}
      it "does not create the survivor" do
        post "/survivors", invalid_params

        expect(response.status).to eq 422

      end
    end
  end
end
