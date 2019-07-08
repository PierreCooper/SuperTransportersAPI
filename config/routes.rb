Rails.application.routes.draw do
  resources :transporters do
    get 'carriers', to: 'transporters#get_carriers'
    collection do
      get 'by_postal_codes', action: 'get_by_postal_codes'
    end
  end
  resources :carriers do
    collection do
      get 'passedBy', action: 'passed_by'
    end
    put 'tracking', to: 'carriers#update_tracking'
  end
  resources :trackings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
