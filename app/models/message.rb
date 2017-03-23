class Message < ApplicationRecord
	belongs_to :chatroom
	belongs_to :user

 	validates :content, presence: true, length: {in: 1..1000}
end
