class StockItem < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :total, numericality: { only_integer: true }
end
