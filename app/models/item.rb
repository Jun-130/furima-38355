class Item < ApplicationRecord
  belongs_to :user

  half_width_digit = /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, format: { with: half_width_digit }, numericality: { in: 300..9_999_999 }
  end
end
