class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatrooms = Chatroom.all
    #includes method for eager loading
    @chatroom = Chatroom.includes(:messages).find_by(id: params[:id])

    #allows new messages to be created
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create 
    @chatroom = Chatroom.create(chatroom_params)
    #Sets admin of chat to user creating it
    @chatroom.admin = current_user
    if @chatroom.save
      #Creates a new membership between admin and chatroom
      Membership.create(user_id: current_user.id, chatroom_id: @chatroom.id)
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to user_path(current_user)
    end
  end

  def edit

  end

  def update
    
  end

  def destroy

  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:title, :description)
  end

end
