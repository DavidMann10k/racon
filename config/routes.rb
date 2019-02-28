Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  get 'secret', to: 'pages#secret'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post 'users/sign_in', to: 'users/sessions#create'
        delete 'users/sign_out', to: 'users/sessions#destroy'
      end
    end
  end
end
