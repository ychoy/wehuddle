class ChatroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :destroy]
  def index
    @chatrooms = Chatroom.public_channels
  end

  def show
    @chatrooms = Chatroom.all
    #includes method for eager loading
    @chatroom = Chatroom.includes(:messages).find_by(id: params[:id])
    @users = User.all
    #allows new messages to be created
    @message = Message.new
  end

  def new
    show
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
    @chatrooms = Chatroom.all
  end

  def update
    @chatrooms = Chatroom.all
    if @chatroom.update(chatroom_params)
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

  def admin_user
    user = current_user
    chatroom = Chatroom.find_by_id(params[:id])
    unless chatroom.admin?(user)
      flash[:error] = "You must be the admin to update a chat"
      redirect_to chatroom_path(@chatroom)
    end
  end

end
