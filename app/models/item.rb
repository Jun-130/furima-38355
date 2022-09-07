class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_day

  half_width_digit = /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: half_width_digit, message: "is invalid. Input half-width characters" }, numericality: { in: 300..9_999_999 }
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end
end
