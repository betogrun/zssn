Rails.application.routes.draw do


  resources :denouncements
  resources :survivors, except: [:update, :destroy] do
      resources :locations
      resources :items
  end
end
