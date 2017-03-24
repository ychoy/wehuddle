class Chatroom < ApplicationRecord

	 default_scope -> {order(created_at: :desc)}

	 has_many :messages, dependent: :destroy
	 has_many :users, through: :memberships

	 validates :title, presence: true, uniqueness: true, length: {in: 1..50}
	 validates :description, length: {maximum: 100}

	 def member?(user)
		 user.chatrooms.include?(self)
	 end
end
