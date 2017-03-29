class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  def index
    @chatrooms = Chatroom.public_channels
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

    if @chatroom.save
      #Creates a new membership between admin and chatroom
      @chatroom.users.push(current_user)
      redirect_to chatroom_path(@chatroom)
    else
      flash[:error] = @chatroom.errors.full_messages.join(", ")
      redirect_to chatrooms_path
    end
  end

  def edit
  end

  def update
    if @chatroom.update_attributes(chatroom_params)
      redirect_to chatroom_path(@chatroom)
    else
      flash[:error] = @chatroom.errors.full_messages.join(", ")
      render 'edit'
    end
  end

  def destroy
    @chatroom.destroy
    redirect_to root_path
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:title, :description, :id, :admin)
  end

end
