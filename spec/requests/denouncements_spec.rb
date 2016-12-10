require 'rails_helper'

RSpec.describe "Denouncements", type: :request do

  describe "GET /denouncements" do
    let(:survivor) { FactoryGirl.create(:survivor)}
    it "show the items that belongs to a survivor" do
      get "/survivors/#{survivor.id}/denouncements"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /survivor/survivor:id/denouncements" do
    context "when the survivor is not a zombie" do
      it "should be able to create a denouncement" do
        
      end

      it "denounced complaints counter should be incremeted by 1" do

      end

      it "should not be able to denounce the same survivor twice" do

      end
    end

    context "when denounced survivor complaints counter hits the limit (3)" do
      it "should mark the denounced survivor as infected" do

      end
    end

    context "when the survivor is a zombie" do
      it "should not be able to create a denouncement" do

      end
    end
  end

end
