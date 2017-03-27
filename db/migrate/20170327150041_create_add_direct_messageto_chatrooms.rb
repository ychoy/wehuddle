class CreateAddDirectMessagetoChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :add_direct_messageto_chatrooms do |t|

      t.timestamps
    end
  end
end
