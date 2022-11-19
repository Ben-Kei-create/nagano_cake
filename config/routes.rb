Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"

}

 scope module: :public do
 get'homes/about' => 'homes#about', as: 'about'
 root to:"homes#top"
 resources :items, only: [:index, :show]
 end

end





# Rails.application.routes.draw do
# devise_for :users
# root to:"homes#top"
# get 'show/edit'
# get'home/about' => 'homes#top', as: 'about'
# resources :books, only: [:create, :index, :show, :destroy, :edit]
# get 'books/:id/edit' => 'books#edit'
# resources :users, only: [:index, :show, :edit, :update]
# patch 'books/:id' => 'books#update', as: 'update_book'

# end