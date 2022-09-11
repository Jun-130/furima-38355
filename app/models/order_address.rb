class OrderAddress

  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :street, :building, :phone_number, :order_id, :user_id, :item_id

  digit3_digit4 = /\A[0-9]{3}-[0-9]{4}\z/

  with_options presence: true do
    validates :zip_code, format: {with: digit3_digit4, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :street
    validates :phone_number
    validates :order_id
    validates :user_id
    validates :item_id
  end
end