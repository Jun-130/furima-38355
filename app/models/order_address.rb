class OrderAddress

  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id

  digit3_digit4 = /\A\d{3}-\d{4}\z/

  with_options presence: true do
    validates :zip_code, format: { with: digit3_digit4, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id
    validates :city
    validates :street
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input only number" },
                             length: { minimum: 10, maximum: 11 }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end