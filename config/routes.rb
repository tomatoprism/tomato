Rails.application.routes.draw do



  root to: 'tops#top'


  devise_for :admins
  devise_for :users

  namespace :admin do
      resources :users, only:[:index]
  end
  scope module: :public do
  	  resources :users, only:[:show, :edit, :update]
  end


  namespace :admin do
      resources :products
  end
  scope module: :public do
  	  resources :products do
  	  	resource :favorites, only:[:index, :create, :destroy]
  	    resource :reviews, only:[:create, :destroy]
  	    resources :discs, only:[:edit, :create, :update, :destroy] do
          resources :tracks, only:[:create, :update, :destroy]
        end
    end
  end


  resources :carts, only:[:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'


  resources :categories, only:[:new, :create, :update, :destroy, :show]


  namespace :admin do
  	  resources :messages, only:[:index, :show]
  end
  scope module: :public do
      resources :messages, only:[:new, :create]
  end


  resources :historoies, only:[:index, :show]


  resources :artists, only:[:new, :create, :update, :destroy, :show]


  resources :posts, only:[:create, :destroy]


  get "/payments" => "payments#show"


  get "/admins" => "admins#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
