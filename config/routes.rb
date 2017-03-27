Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'chatrooms#index'

  mount ActionCable.server => '/cable'

  delete '/chatrooms/:id', to: 'chatrooms#destroy', as: 'chatroom_delete'
  resources :chatrooms
  resources :messages, only: [:create, :new, :show]
  resources :memberships, only: [:create, :destroy]
end
