Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  #mypages route
  resources :mypage, only: [:index] do
  end
  
  #patterns route
  resources :patterns, only: [:index, :show] do
    collection do
      get 'list' => 'patterns#list'
      get 'tiny/:id' => 'patterns#tiny'
      get 'unit/:id' => 'patterns#unit'
    end
  end
  
  #static_pages route
  resources :static_pages, only: [:index] do
    collection do
      #get '/privacy_policy' => 'static_pages#privacy_policy'
      #get '/service_agreement' => 'static_pages#service_agreement'
      get '/vision' => 'static_pages#vision'
      get '/tutorial' => 'static_pages#tutorial'
      get '/sendgrid' => 'static_pages#sendgrid'
    end
  end
  
  resources :excharts, only: [:index, :new, :show, :create] do
    collection do
      get 'event' => 'excharts#event'
      get '/:language_id/:pattern_no/detail' => 'excharts#patterndetail'
      get ':id/pdf' => 'excharts#pdf'
      post ':id/pdf' => 'excharts#pdf'
      post ':id/send_pdf' => 'excharts#send_pdf'
      get 'compare' => 'excharts#compare'
      get 'compare/result' => 'excharts#compare_result'
    end
  end
  
  resources :shuffles, only: [:index] do
    collection do
      get 'app' => 'shuffles#app'
    end
  end
  
  
  root 'welcome#index'

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
