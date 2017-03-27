class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :memberships, dependent: :destroy
  has_many :chatrooms, through: :memberships


  validates :username, presence: true, length: {in: 1..15}
end
