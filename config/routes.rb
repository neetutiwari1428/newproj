Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :registrations
  resources :registrations, only: [] do 
    collection do
      post 'sign_up', to: 'registrations#sign_up'
      post 'sign_in', to: 'registrations#sign_in'
    end 
  end
end
