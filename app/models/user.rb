class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :resolutions
has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
has_many :following, through: :active_relationships, source: :followed
has_many :followers, through: :passive_relationships, source: :follower
has_many :blogs
def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'guests'
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.name = 'Guest administrator'
      user.password = SecureRandom.urlsafe_base64
      user.admin = 'true'
    end
  end 

def follow!(other_user)
  active_relationships.create!(followed_id: other_user.id)
end
#See if you follow
def following?(other_user)
  active_relationships.find_by(followed_id: other_user.id)
end
def unfollow!(other_user)
  active_relationships.find_by(followed_id: other_user.id).destroy
end
end
