require 'faker'

10.times do |t|
  product = Product.create(name: Faker::Food.fruits, price: rand(Math::E..Math::PI).round(2))
  store = Store.create(name: Faker::Company.name, address: Faker::Address.full_address)

  StockItem.create(product: product, store: store, total: rand(20))
end