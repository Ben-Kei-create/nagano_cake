Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 scope module: :public do
 get'homes/about' => 'homes#about', as: 'about'
 root to:"homes#top"
 resources :items, only: [:index, :show]
 resources :cart_items, only: [:index, :destroy]
 resources :orders, only: [:new, :index, :show, :create]
 resources :customers, only: [:edit, :update, :show]
 get 'orders/complete' => 'orders#complete'
 post 'orders/confirm' => 'orders#confirm'
 get 'customers/unsubscribe' => 'customers#unsubscribe'
 get 'customers/information' => 'customers#show'
 post 'customers/information' => 'customers#new'
 delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
 end

 namespace :admin do
 resources :items, only: [:index, :new, :create, :show, :edit, :update]
 resources :customers, only: [:index, :show, :edit]
 resources :genres, only: [:index, :create, :edit, :update]
 resources :orders, only: [:show]
 post 'items' => 'items#create'
 patch 'items/:id' => 'items#update'
 get '/' => 'homes#top'
 end
end