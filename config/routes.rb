SpicyOrangesWebsite::Application.routes.draw do

  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get 'signup' => 'users#new', as: :signup
    get 'login' => 'sessions#new', as: :login
  end

  get 'logout' => 'sessions#destroy', as: :logout

  root 'pages#inicio'

  resources :users
  resources :sessions

  resources :pages
  resources :productos

  # special pages
  get 'inicio' => 'pages#inicio', as: :pages_inicio
  get 'empresa' => 'pages#empresa', as: :pages_empresa
  get 'trabajos' => 'pages#trabajos', as: :pages_trabajos
  get 'contacto' => 'pages#contacto', as: :pages_contacto


  # Products pages
  #get 'productos/showerroom' => 'productos#showerroom', as: :products_showerroom


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
