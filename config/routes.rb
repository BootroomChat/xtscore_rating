Rails.application.routes.draw do
  root to: 'teams#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :matches, only: [:index, :show] do
    resources :formations, only: [:index]
  end
  resources :teams, only: [:index, :show]

  resources :ratings, only: [:new, :create, :index]
  resources :calculators, only: [:new, :create]
end
