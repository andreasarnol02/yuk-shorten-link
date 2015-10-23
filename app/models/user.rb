class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable, 
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  mount_uploader :avatar, AvatarUploader
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :authentications, dependent: :destroy
  has_many :urls, dependent: :destroy
  has_many :visits, dependent: :nullify
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates_presence_of :name

  def self.from_omniauth(auth)
    joins(:authentications).where(authentications: { provider: auth.provider, uid: auth.uid }).first_or_create do |user|
      token = Devise.friendly_token[0, 12]

      user.email = auth.info.email.present? ? auth.info.email : "mail-#{auth.uid}-#{auth.provider}@yuk.com"
      user.name = auth.info.name
      user.password = token
      user.password_confirmation = token
      user.skip_confirmation!

      user.authentications.build(uid: auth.uid, provider: auth.provider)
    end
  end

  def already_connected(provider)
    authentications.where(provider: provider)
  end

  def connect_account(uid, provider)
    authentications.create(uid: uid, provider: provider)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user_id)
    following.include?(User.find(other_user_id))
  end

  def following_ids
    following.map(&:id)
  end
end
