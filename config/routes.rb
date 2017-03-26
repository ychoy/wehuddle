Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'chatrooms#index'

  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages, only: [:create, :new, :show]
end
