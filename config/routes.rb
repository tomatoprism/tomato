Rails.application.routes.draw do
  root to:'top#top'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

 post "/post_update" => "public/users#post_update"

  namespace :admin do
      resources :users, only:[:index, :show]
  end
  scope module: :public do
  	  resources :users, only:[:show, :edit, :update, :destroy]
  end

  namespace :admin do
      resources :products
  end
  scope module: :public do
  	  resources :products do
  	  	resource :favorites, only:[:index, :create, :destroy]
  	    resources :reviews, only:[:create, :destroy]
  	    resources :discs, only:[:edit, :create, :update, :destroy] do
          resources :tracks, only:[:create, :update, :destroy]
        end
    end
  end

  resources :carts, only:[:show] do
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/cart_items/:id' => 'carts#delete_item',as: 'delete_item'
end

  resources :categories, only:[:new, :create, :update, :destroy, :show, :edit]
  resources :animes, only:[:index, :create, :update, :destroy, :show, :edit]

  namespace :admin do
  	  resources :messages, only:[:index, :show]
  end
  scope module: :public do
      resources :messages, only:[:new, :create]
  end

  resources :histories, only:[:index, :show, :create, :update, :new]

  resources :artists, only:[:new, :create, :update, :destroy, :show, :edit, :index]

  get "/admins" => "admins#top"

  get "/search/products" => "public/products#search"

  get "/favorites" => "public/favorites#index"

  resources :posts, only:[ :new, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
