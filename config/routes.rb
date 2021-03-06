Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  delete '/logout', to: 'sessions#destroy'

  get "/auth/:provider/callback" => "sessions#create" 
  
  get 'auth/logout' => 'sessions#destroy'

  get 'skills/search' => "searches#search", as: :new_search

  root 'statics#home'

  get 'statics/about' => "statics#about"
  get 'statics/contact' => "statics#contact"

  resources :users do
    resources :skills, except: :index do
     resources :charges, only: [:new, :create]
     end
  end
  
  get 'users/:user_id/seller_reviews' => 'seller_reviews#show', as: "seller_reviews"

  get 'skills' => "skills#index" 
  
  namespace :api do
     resources :skills, only: [:index, :show] 
  end

  get 'users/:id/sales' => "charges#sales", as: "sales"
  get 'users/:id/purchases' => "charges#purchases", as: "purchases"

  post 'users/:id/purchases' => "reviews#create", as: :create_review
  patch 'users/:id/purchases' => "reviews#update", as: :update_review

  resources :categories
  resources :subcategories

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
