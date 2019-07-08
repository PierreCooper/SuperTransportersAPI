Rails.application.routes.draw do
  resources :transporters do
    get 'carriers', to: 'transporters#get_carriers'
  end
  resources :carriers do
    put 'tracking', to: 'carriers#update_tracking'
  end
  resources :trackings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
