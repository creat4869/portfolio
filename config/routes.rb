Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  root 'tops#index'
  resources :tops, only: :index
  resources :abouts, only: :index
  resources :works
  resources :galleries, except: :show
end
