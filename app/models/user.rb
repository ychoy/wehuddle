class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :memberships, dependent: :destroy
  has_many :chatrooms, through: :memberships

  validates :first_name, presence: true, length: { in: 1..50}
  validates :last_name, presence: true, length: { in: 1..50}
  validates :username, presence: true, length: { in: 1..25}
end
