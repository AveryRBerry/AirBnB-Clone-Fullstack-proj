Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create, :update, :show]
    resource :session, only: [:show, :create, :destroy]
    resources :listings, only: [:index, :create, :update, :show, :destroy]
  end

  get '*path', to: "static_pages#frontend_index" 
end
