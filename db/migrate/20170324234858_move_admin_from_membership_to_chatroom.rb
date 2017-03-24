class MoveAdminFromMembershipToChatroom < ActiveRecord::Migration[5.0]
  def change
  	remove_column :memberships, :is_admin?, :boolean
  	add_column :chatrooms, :admin, :integer
  end
end
