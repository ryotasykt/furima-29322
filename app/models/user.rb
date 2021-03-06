class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :email, uniqueness: true
    validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
    validates :family_name_kanji, format: { with: NAME_KANJI_REGEX, message: 'Full-width characters' }
    validates :first_name_kanji, format: { with: NAME_KANJI_REGEX, message: 'Full-width characters' }
    validates :family_name_kana, format: { with: NAME_KANA_REGEX, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: NAME_KANA_REGEX, message: 'Full-width katakana characters' }
    validates :birth_day
  end
end
