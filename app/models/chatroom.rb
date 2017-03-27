class Chatroom < ApplicationRecord

	 default_scope -> {order(created_at: :desc)}

	 has_many :messages, dependent: :destroy
	 has_many :memberships, dependent: :destroy
	 has_many :users, through: :memberships

	 scope :public_channels, ->{ where(direct_message: false) }
	 scope :direct_messages, ->{ where(direct_message: true) }

	 validates :title, presence: true, uniqueness: true, length: {in: 1..50}
	 validates :description, length: {maximum: 100}


	 def member?(user)
		 user.chatrooms.include?(self)
	 end

	 def admin?(user)
	 	return true if self.admin == user.id
	 end

end
