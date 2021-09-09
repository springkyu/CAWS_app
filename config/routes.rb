Rails.application.routes.draw do

  devise_for :admins, contollers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  root to: "homes#top"

  namespace :admins do
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :areas, only: [:index, :create, :edit, :update, :destroy]
  end

  scope module: :users do
    resource :users, only: [:show, :edit, :update]
    get "users/unsubscribe" => "users#unsubscribe"
    patch "users/withdraw" => "users#withdraw"

    resources :posts do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :edit, :update, :destroy]
    end

  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end