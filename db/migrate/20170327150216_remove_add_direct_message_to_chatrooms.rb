class RemoveAddDirectMessageToChatrooms < ActiveRecord::Migration[5.0]
  def change
    drop_table :add_direct_messageto_chatrooms
  end
end
