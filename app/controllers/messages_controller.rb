class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: "#{message.user.first_name} #{message.user.last_name}",
        avatar: (helpers.asset_path(message.user.avatar.thumb.url)),
        created_at: message.created_at
      head :ok
    else
      flash[:error] = @message.errors.full_messages.join(", ")
       redirect_to chatrooms_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end
end
