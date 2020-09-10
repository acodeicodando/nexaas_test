require 'rails_helper'

RSpec.describe "Stores", type: :request do

  describe "Create store and return his detail" do
    it "returns http success" do
      post stores_path, params: { store: attributes_for(:store) }
      expect(response).to have_http_status(:success)
    end
  end

  context "With a store in database" do
    before do
      @store = create(:store)
    end

    describe "Update store and return his detail" do
      it "returns http success" do
        put store_path(@store), params: { store: { name: 'Store 02 Updated', address: 'the address of store updated' }}
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['name']).to eql('Store 02 Updated')
        expect(body['address']).to eql('the address of store updated')
      end
    end
  
    describe "Show store detail" do
      it "returns http success" do
        get store_path(@store)
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['name']).to eql('Store 01')
        expect(body['address']).to eql('the address of store')
      end
    end
  
    describe "GET /destroy" do
      it "returns http success" do
        delete store_path(@store)
        expect(response).to have_http_status(:success)
        expect(response.code).to eql('204')
      end
    end
  end

end
