class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable, 
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :authentications, dependent: :destroy

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
end
