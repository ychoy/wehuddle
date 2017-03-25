class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  def index
    @chatrooms = Chatroom.all
  end

  def show
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
    
    # TODO: Creates a new chatroom
    # make a chatroom
    # make a memmbership
    # set is_admin? to true
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
