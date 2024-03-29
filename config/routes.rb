IndStudy::Application.routes.draw do

#Pages
root :to => 'articles#index'
get'/about' => 'pages#about'

get '/search' => 'articles#search'

resources :sessions, :only => [:new, :create, :destroy]

# get 'article_title/:article_id' => 'article_titles#edit', :as => 'edit_article_title'
# put 'article_title/:article_id' => 'article_titles#update', :as => 'article_title'
# delete 'article_title/:article_title_id' => 'article_titles#destroy', :as => 'article_title'


resources :articles do

  resources :article_titles, :as => 'titles'

  resources :sections, :except => [:show, :index] do
      resources :sub_sections, :except => [:show, :index]
  end

  resources :comments, :only => [:new, :create, :index, :destroy]

  resources :sources, :except => [:index]

  resources :admin_messages, :only => [:new, :create]

end

resources :users, :only => [:show, :new, :create]

resources :admin_messages, :only => [:index, :edit, :update, :destroy]



#AJAX routes
get 'get_section' => 'ajax#get_section'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
