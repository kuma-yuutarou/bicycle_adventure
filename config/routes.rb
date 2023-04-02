Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :notifications,only: [:index, :create] #onlyでだけ
  #get 'notifications/index'
  #get 'notifications/create'

  resources :likes,only: [:create, :destroy]
  #get 'likes/create'
  #get 'likes/destroy'

  resources :comments,only: [:create, :destroy]
  #get 'comments/create'
  #get 'comments/destroy'

  namespace :admin do
    resources :users,except: [:new, :create, :destroy] #except除外する書き方
    #get 'users/index'
    #get 'users/show'
    #get 'users/edit'
    #get 'users/update'
  end

  namespace :admin do
    get 'homes/top'
  end

  resources :users,only: [:show, :edit, :update, :index] do
    get 'unsubscribe'
    patch 'withdrawal'
  end
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'

  resources :posts #7つ含まれている　[index,show,new,create,edit,update,destroy]
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/edit'
  # get 'posts/update'
  # get 'posts/destroy'

  get 'homes/top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
