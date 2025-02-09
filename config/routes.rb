Rails.application.routes.draw do
  resources :storefronts do
    resources :reasons, only: [:edit, :update]
  end

  patch "storefronts/edit_reason/:id", to: "storefronts#edit_reason"
  patch "storefronts/delete_reson/:id", to: "storefronts#delete_reson"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "storefronts#edit", id: 1

  patch "storefronts/:id/update_position", to: 'storefronts#update_position', as: "update_position"

end
