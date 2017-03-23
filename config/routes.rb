Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/secret', to: 'home#secret', as: :secret
  resources :chatrooms, only: [:show, :edit, :update]
  resources :messages, only: [:create, :new, :show]
end
