class StockItem < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :total, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
