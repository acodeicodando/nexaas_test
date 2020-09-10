Rails.application.routes.draw do
  resources :products, except: :index do
    member do
      put :update_stock_item
    end
  end
  resources :stores, except: :index
end