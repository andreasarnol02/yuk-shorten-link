class Url < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  
  after_create :encode_url, unless: :not_custom

  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

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

  def not_custom
    self.type_url.eql?("custom")
  end

end
