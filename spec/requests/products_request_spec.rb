require 'rails_helper'

RSpec.describe "Products", type: :request do

  describe "Create product and return his detail" do
    it "returns http success" do
      post products_path, params: { product: {name: 'Product 01', price: 25.75} }
      expect(response).to have_http_status(:success)
    end
  end

  context "With a product in database" do
    before do
      @product = Product.create(name: 'Product 02', price: 15.25)
    end

    describe "Update product and return his detail" do
      it "returns http success" do
        put product_path(@product), params: { product: { name: 'Product 02 Updated', price: 20 }}
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['name']).to eql('Product 02 Updated')
        expect(body['price']).to eql(20.0)
      end
    end
  
    describe "Show product detail" do
      it "returns http success" do
        get product_path(@product)
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['name']).to eql('Product 02')
        expect(body['price']).to eql(15.25)
      end
    end
  
    describe "GET /destroy" do
      it "returns http success" do
        delete product_path(@product)
        expect(response).to have_http_status(:success)
        expect(response.code).to eql('204')
      end
    end
  end

end
