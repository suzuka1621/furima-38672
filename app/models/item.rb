class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :order
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_cost
  belongs_to :delivery_region
  belongs_to :delivery_day
  
  has_one_attached :image
end
