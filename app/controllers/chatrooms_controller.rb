class ChatroomsController < ApplicationController
  def show
    #includes method for eager loading
    @chatroom = Chatroom.includes(:messages).find_by(id: params[:id])

    #allows new messages to be created 
    @message = Message.new
  end
end
