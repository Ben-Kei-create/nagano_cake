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
 resources :cart_items, only: [:index]
 end

 namespace :admin do
 resources :items, only: [:index, :new, :create, :show, :edit, :update]
 post 'items' => 'items#create'
 patch 'items/:id' => 'items#update'
 resources :customers, only: [:index, :show]
 get'homes/admin' => 'homes#top'
 resources :genres, only: [:index, :create, :edit, :update]
 end
end