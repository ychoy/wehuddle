class MembershipsController < ApplicationController

  def index
    @user = current_user.user_id
    @chatrooms = Chatroom.find_by_id(@user)
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom.users.push(current_user) unless @chatroom.member?(current_user)
    redirect_to chatroom_path(@chatroom)
  end

  def destroy
  	@chatroom = Chatroom.find(params[:chatroom_id])
  	@chatroom.users.destroy(current_user)
  	redirect_to chatroom_path(@chatroom)
  end

end
