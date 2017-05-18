class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages', # BUG: this goes out to everyone
        message: message.content,
        user: "#{message.user.first_name} #{message.user.last_name}",
        avatar: helpers.asset_path(message.user.avatar.thumb.url),
        created_at: message.created_at
      head :ok
    else
      # TODO:
      # ActionCable.server.broadcast 'errors',
      # message: @message.errors.full_messages.join(", ")
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end
end
