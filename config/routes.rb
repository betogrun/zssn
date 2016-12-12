Rails.application.routes.draw do

  resources :reports, only: [:index, :show]
  resources :barters, only: :create
  resources :survivors, except: [:update, :destroy] do
      resources :locations
      resources :items
      resources :denouncements, except: [:update, :destroy]
  end
end
