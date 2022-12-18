Rails.application.routes.draw do
scope module: :public do
 get'homes/about' => 'homes#about', as: 'about'
 root to:"homes#top"
 resources :items, only: [:index, :show]
 delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
 resources :cart_items, only: [:index, :destroy, :create, :update]
 resources :orders, only: [:new, :index, :show, :create]
 resources :addresses, only: [:new, :index, :show, :create, :update, :destroy, :edit]
 resource :customers, only: [:edit, :update, :show]
 get 'orders/complete' => 'orders#complete'
 get 'customers/unsubscribe' => 'customers#unsubscribe'
 get 'customers/information' => 'customers#show'
 post 'orders/confirm' => 'orders#confirm'
 post 'customers/information' => 'customers#new'
 end

 namespace :admin do
 root to:"homes#top"
 resources :items, only: [:index, :new, :create, :show, :edit, :update]
 resources :customers, only: [:index, :show, :edit]
 resources :genres, only: [:index, :create, :edit, :update]
 resources :orders, only: [:show]
 post 'items' => 'items#create'
 patch 'items/:id' => 'items#update'
 end

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end