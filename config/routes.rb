Rails.application.routes.draw do
  devise_for :users, except: [:show], controllers: { sessions: 'users/sessions' }
  root to: 'chatrooms#index'

  mount ActionCable.server => '/cable'

  get '/users/:id', to: 'users#show', as: 'user'

  delete '/chatrooms/:id', to: 'chatrooms#destroy', as: 'chatroom_delete'

  resources :chatrooms, except: [:destroy]

  resources :messages, only: [:create, :new, :show]


  get '/users/:user_id/chatrooms', to: 'memberships#index', as: 'users_memberships'
  post '/chatrooms/:chatroom_id/users', to: 'memberships#create', as: 'memberships_users'
  delete '/chatrooms/:chatroom_id/users', to: 'memberships#destroy', as: 'membership_destroy'
  resources :direct_messages

end
