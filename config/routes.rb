Rails.application.routes.draw do
  devise_for :users
  
  resources :users
  
  resources :collections do
  	resources :coins 
    member do
      scope module: "collection" do
      resources :toggle_coins, param: :toggle_coin_id
      end
    end
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
