Rails.application.routes.draw do
  root to: 'matches#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :matches, only: [:index, :show] do
    resources :formations, only: [:index]
  end
  resources :ratings, only: [:new, :create, :index]
end
