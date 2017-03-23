class Chatroom < ApplicationRecord
	 
	 default_scope -> {order(created_at: :desc)}

	 validates :title, presence: true, uniqueness: true, length: {in: 1..50}
	 validates :description, length: {maximum: 100}
end
