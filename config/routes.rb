Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    # registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: "homes#top"
  get "/about" => "homes#about"

  get   'inquiry'         => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'


  namespace :admins do
    resources :posts, only: [:index, :show, :destroy]
      resources :comments, only: [:destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :areas, only: [:index, :create, :edit, :update, :destroy]

    get "/search" => "searches#search"
  end

  scope module: :users do
    get "users/unsubscribe" => "users#unsubscribe"
    patch "users/withdraw" => "users#withdraw"
    resources :users, only: [:show, :edit, :update] do
      member do
        get :likes
      end
    end

    resources :posts do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    get "/search" => "searches#search"

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
