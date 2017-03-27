Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'chatrooms#index'

  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages, only: [:create, :new, :show]

  get '/users/:user_id/chatrooms', to: 'memberships#index', as: 'users_memberships'
  post '/chatroomss/:chatroom_id/users', to: 'memberships#create', as: 'memberships_users'

end
