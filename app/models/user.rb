class User < ApplicationRecord
  has_many :items
  has_many :buyers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6}\z/

  with_options presence: true do
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :family_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birth_day
    validates :email
    validates :nickname
  end

end
