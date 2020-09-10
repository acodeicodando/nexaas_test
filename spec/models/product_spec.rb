require 'rails_helper'

RSpec.describe Product, type: :model do
  context "Create or Update the stock item of store product" do
    before do
      @product = create(:product)
      @store = create(:store)
    end
    
    describe "add stock quantity to product" do
      it "create stock without quantity" do
        expect(@product.update_stock_item({store_id: @store.id})).to be_truthy
        expect(@product.stock_for(@store.id)).to eql(0)
      end

      it "create stock with quantity" do
        expect(@product.update_stock_item({store_id: @store.id, value: 20})).to be_truthy
        expect(@product.stock_for(@store.id)).to eql(20)
      end
    end

    describe "update stock quantity product" do
      before do
        @product.update_stock_item({store_id: @store.id, value: 40})
      end
      
      it "increase stock item" do
        @product.update_stock_item({store_id: @store.id, value: 20})
        expect(@product.stock_for(@store.id)).to eql(60)
      end

      it "decrease stock item" do
        @product.update_stock_item({store_id: @store.id, value: -20})
        expect(@product.stock_for(@store.id)).to eql(20)
      end

      it "try force negative stock item" do
        expect(@product.update_stock_item({store_id: @store.id, value: -41})).to be false
      end
      
    end
    
    
  end
  
end
