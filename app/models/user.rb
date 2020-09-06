class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :purchases

         with_options presence: true do
           validates :nickname, length: { maximum: 40 }
           validates :email, uniqueness: true
           validates :password, length: {minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
           validates :family_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
           validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
           validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'Full-width katakana characters' }
           validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'Full-width katakana characters'}
           validates :birth_day
         end
end
