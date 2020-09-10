require 'faker'
FactoryBot.define do
  factory :store do
    name { "Store 01" }
    address  { "the address of store" }
  end

  factory :product do
    name { "Product 01" }
    price  { 25.50 }
  end
end