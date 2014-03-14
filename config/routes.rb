OpptakIsfitOrg::Application.routes.draw do
  resources :applicant_users, except: [ :new]
  root to: "positions#index"
  
  get 'section/:id'  => "positions#section", as: "section"
  get 'group/:id'  => "positions#group", as: "positions_group"


  resources :positions do
    collection do
      get :apply
      post :validate
      post :save
    end
  end 
  get "/positions/edit/:id", to: "positions#edit"
  get "it-utvikler", to: "positions#show", defaults: { id: 513 }

  get "/applicant_user", to: "applicant_users#show", as: :show_applicant_user

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"

  get "/forgotten_password", to: "sessions#forgotten_password"
  post "/forgotten_password", to: "sessions#new_password"

  get "logout", to: "sessions#destroy"

 # resources :applicant_users, except: [ :show, :destroy ]

  #get 'apply/position' => "positions#index", as: "apply_positions"
  

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
