Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions'}
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}

  resources :arts

  resources :comments

  get '/users/index/:id' => 'information#index' , as: 'user_index'

  get '/forums/:id' => 'forums#show', as: 'forum_show'

  get '/topics/new' => 'topics#new', as: 'topic_new'

  post '/topics' => 'topics#create'

  get '/topics/:id' => 'topics#show', as: 'topic_show'

  get '/topics/:id/edit' => 'topics#edit', as: 'topic'

  patch '/topics/:id/edit' => 'topics#update'

  post '/topics/sticky' => 'topics#sticky', as: 'sticky'

  post '/topics/anchor' => 'topics#anchor', as: 'anchor'

  get '/panel' => 'panel#show', as: 'admin_panel'

  post '/panel/mod' => 'panel#mod', as: 'toggle_mod'

  get '/topics/:topic_id/posts/:reply_id/new' => 'posts#new', as: 'posts_new'

  post '/topics/:topic_id/posts' => 'posts#create', as: 'posts'

  get '/topics/posts/:id/edit' => 'posts#edit', as: 'posts_edit'

  patch '/topics/posts/:id' => 'posts#update', as: 'post'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#home'

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
