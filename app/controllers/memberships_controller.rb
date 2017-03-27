class MembershipsController < ApplicationController

  def index
    @user = current_user.user_id
    @chatrooms = Chatroom.find_by_id(@user)
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    #membership = Membership.new(user_id: current_user.id, chatroom_id: @chatroom.id)
    #if membership.save
    #  @#chatroom.users.push(current_user)
    @chatroom.users.push(current_user) unless @chatroom.member?(current_user)
    redirect_to chatroom_path(@chatroom)

  end

end
