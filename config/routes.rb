Rails.application.routes.draw do
  resources :products, except: :index
  resources :stores, except: :index
end
