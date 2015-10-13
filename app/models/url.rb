class Url < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true
  validates :shorten, presence: true, on: :update
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_format_of :shorten, with: /^[A-Za-z0-9]+$/, multiline: true, message: "Only numeric and character allowed!", on: :update
  validate :check_shorten, on: :update
  validate :same_user, on: :create

  after_create :encode_url, unless: :custom

  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

  def same_user
    if Url.find_by(user_id: self.user_id, url: self.url).present?
      errors.add(:url_unique, "This url already registered within your account.")
    end
  end

  def encode_url
    id = self.id
    return ALPHABET[0] if id == 0
    s = ''
    base = ALPHABET.length
    while id > 0
      s << ALPHABET[id.modulo(base)]
      id /= base
    end
    self.update_attributes(shorten: s.reverse)
  end

  def custom
    self.type_url.eql?("custom")
  end

  def check_shorten
    errors.add(:shorten, "Shorten URL already taken. Please choose another shorten!") if Url.where("shorten = ?", self.shorten).present?
  end
end
