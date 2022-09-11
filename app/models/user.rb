class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  full_width = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  full_width_kana = /\A[ァ-ヶー]+\z/

  validates_format_of :password, { with: PASSWORD_REGEX, messege: "is invalid. Include both letters and numbers" }

  with_options presence: true do
    validates :nickname
    validates :birth_date
    with_options format: { with: full_width, message: "is invalid. Input full-width characters" } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: full_width_kana, message: "is invalid. Input full-width katakana characters" } do
      validates :kana_last_name
      validates :kana_first_name
    end
  end
end
