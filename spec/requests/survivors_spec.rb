require 'rails_helper'

RSpec.describe "Survivors", type: :request do

  describe "GET /survivors" do
    it "show the survivor" do
      get survivors_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /survivors" do
    let(:attributes) {{:name => "Jonh", :age => 24, :gender => :male, :is_infected => false, :complaints => 0}}
    let(:params) {{format: :json, survivor: attributes}}

    it "creates the survivor" do
      post "/survivors", params

      expect(response.status).to eq 201

      body = JSON.parse(response.body)
      expect(body['name']).to eq "Jonh"
      expect(body['age']).to eq 24
      expect(body['gender']).to eq "male"
      expect(body['is_infected']).to eq false
      expect(body['complaints']).to eq 0
    end
  end
end
