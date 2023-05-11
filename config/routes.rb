Rails.application.routes.draw do

  devise_for :admins, controllers: {
        sessions: 'admin/sessions'
      }

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  root to: "homes#top"

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

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
    resources :users,except: [:new, :create, :destroy] do#except除外する書き方
      get 'unsubscribe'
      patch 'withdrawal'
    end
    #get 'users/index'
    #get 'users/show'
    #get 'users/edit'
    #get 'users/update'
  end

  namespace :admin do
    get 'homes/top'
    resources :posts, only: [:show, :destroy] do
      resources :comments, only: [:destroy]
    end
  end

  resources :users,only: [:show, :edit, :update, :index] do
    get 'unsubscribe'
    patch 'withdrawal'
    member do
      get :likes
    end
  end
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'

  resources :posts do  #7つ含まれている　[index,show,new,create,edit,update,destroy]
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
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
