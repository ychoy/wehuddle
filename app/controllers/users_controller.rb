class UsersController < ApplicationController
  def show
  	@user = User.find_by_id(params[:id])
    @memberships = @user.memberships

    # allows sidebar menu to populate
    @chatrooms = Chatroom.all
    #includes method for eager loading
    @chatroom = Chatroom.includes(:messages).find_by(id: params[:id])

    #allows new messages to be created
    @message = Message.new
  end
end
