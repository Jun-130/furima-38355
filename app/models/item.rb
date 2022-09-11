class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters" },
                      inclusion: { in: 300..9_999_999, message: "is out of setting range" }
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
