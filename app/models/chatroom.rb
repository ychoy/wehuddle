class Chatroom < ApplicationRecord

	 default_scope -> {order(created_at: :desc)}

	 has_many :messages, dependent: :destroy
	 has_many :memberships, dependent: :destroy
	 has_many :users, through: :memberships

	 scope :public_channels, ->{ where(direct_message: false) }
	 scope :direct_messages, ->{ where(direct_message: true) }

	 validates :title, presence: true, uniqueness: true, length: {in: 1..50}
	 validates :description, length: {maximum: 100}

	 def self.direct_message_for_users(users)
	 	user_firstnames = users.map(&:first_name).sort
	 	title = "#{user_firstnames.join(", ")}"

	 	if chatroom = Chatroom.direct_messages.where(title: title).first
	 		chatroom
	 	else
	 		# create a new chatroom
	 		chatroom = Chatroom.new(title: title, direct_message: true)
	 		chatroom.users = users
	 		chatroom.save
	 		chatroom
	 	end
	 end

	 def member?(user)
		 user.chatrooms.include?(self)
	 end

	 def admin?(user)
	 	return true if self.admin == user.id
	 end

	 def is_direct_message?
	 	return self.direct_message
	 end

end
