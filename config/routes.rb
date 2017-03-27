Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'chatrooms#index'

  mount ActionCable.server => '/cable'

  delete '/chatrooms/:id', to: 'chatrooms#destroy', as: 'chatroom_delete'
  resources :chatrooms
  resources :messages, only: [:create, :new, :show]


  get '/users/:user_id/chatrooms', to: 'memberships#index', as: 'users_memberships'
  post '/chatrooms/:chatroom_id/users', to: 'memberships#create', as: 'memberships_users'
  resources :direct_messages

  resources :memberships, only: [:destroy]
end
