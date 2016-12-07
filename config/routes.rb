Rails.application.routes.draw do

  resources :survivors do
      resources :locations
  end
end
