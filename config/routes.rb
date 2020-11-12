Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "cocktails#index"

  # V1 MVC Cocktails
  # resources :cocktails, only: [:index, :new, :create, :show]

  # V2 MVC Cocktails + nested Doses
  resources :cocktails, only: [:index, :new, :create, :show] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
