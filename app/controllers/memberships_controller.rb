class MembershipsController < ApplicationController

  def index
    @user = current_user.user_id
    @chatrooms = Chatroom.find_by_id(@user)
  end

  def join
    @chatroom = Chatroom.find(params[:id])
    @chatroom.users.push(current_user) unless @chatroom.member?(current_user)
  end

end
