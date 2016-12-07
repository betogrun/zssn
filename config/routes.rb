Rails.application.routes.draw do


  resources :survivors do
      resources :locations
      resources :items
  end
end
