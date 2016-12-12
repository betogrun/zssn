Rails.application.routes.draw do

  resources :reports
  resources :barters
  resources :survivors, except: [:update, :destroy] do
      resources :locations
      resources :items
      resources :denouncements, except: [:update, :destroy]
  end
end
