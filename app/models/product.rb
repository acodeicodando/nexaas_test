class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :name, uniqueness: true

  def update_stock_item(stock_item_attributes)
    stock_item = StockItem.find_or_create_by!(product_id: self.id, store_id: stock_item_attributes[:store_id])
    stock_item.total += stock_item_attributes[:value].to_i
    stock_item.save
  end

  def stock_for(store_id)
    stock_item = StockItem.find_by_store_id(store_id)
    stock_item.total
  end
end
