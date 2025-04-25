class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
VALID_KATAKANA_REGEX = /\A[\p{katakana}ー－]+\z/
VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+\z/

validates :nickname, presence: true 
validates :birthday, presence: true       
validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }
validates :last_name, presence: true ,format: { with: VALID_ZENKAKU_REGEX, message: 'is invalid. Input full-width characters' }
validates :first_name, presence: true,format: { with: VALID_ZENKAKU_REGEX, message: 'is invalid. Input full-width characters' }
validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
validates :first_name_kana, presence: true,format: { with: VALID_KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters' }

end
