Rails.application.routes.draw do
  devise_for :admins, contollers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root to: "homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end