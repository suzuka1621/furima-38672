class OrderDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address_number, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id, :item_id 
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipality, :address_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is too short"}
  end
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  
  
  def save
    # 購入者情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality,
                    address_number: address_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end