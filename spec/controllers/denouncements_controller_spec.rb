require 'rails_helper'
RSpec.describe DenouncementsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Denouncement. As you add validations to Denouncement, be sure to
  # adjust the attributes here as well.
  let(:survivor) {FactoryGirl.create(:survivor)}
  let(:denounced) {FactoryGirl.create(:survivor)}
  let(:valid_attributes) {
    {survivor_id: survivor.id, denounced_id: denounced.id}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DenouncementsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all denouncements as @denouncements" do
      denouncement = Denouncement.create! valid_attributes
      get :index, params: {survivor_id: survivor.id}, session: valid_session
      expect(assigns(:denouncements)).to eq([denouncement])
    end
  end

  describe "GET #show" do
    it "assigns the requested denouncement as @denouncement" do
      denouncement = Denouncement.create! valid_attributes
      get :show, params: {survivor_id: survivor.id, id: denouncement.to_param}, session: valid_session
      expect(assigns(:denouncement)).to eq(denouncement)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Denouncement" do
        expect {
          post :create, params: {survivor_id: survivor.id, denouncement: valid_attributes}, session: valid_session
        }.to change(Denouncement, :count).by(1)
      end

      it "assigns a newly created denouncement as @denouncement" do
        post :create, params: {survivor_id: survivor.id, denouncement: valid_attributes}, session: valid_session
        expect(assigns(:denouncement)).to be_a(Denouncement)
        expect(assigns(:denouncement)).to be_persisted
      end
    end
  end

end
