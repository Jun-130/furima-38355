class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
