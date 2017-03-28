class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  
  has_many :messages
  has_many :memberships, dependent: :destroy
  has_many :chatrooms, through: :memberships

  validates :first_name, presence: true, length: { in: 1..50}
  validates :last_name, presence: true, length: { in: 1..50}
  validates :username, presence: true, uniqueness: true, length: { in: 1..25}

  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar


	def member?(chatroom)
    chatroom.users.include?(self)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end

end
