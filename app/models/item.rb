class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_day

  #共通のバリデーション
  validates :image, :item, :introduction, :price, :category_id, :item_state_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, presence: true

  #priceのバリデーション
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" },
            inclusion: { in: 300..9_999_999, message: "is out of setting range" }

  #category_idの設定
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  #item_status_idの設定
  validates :item_state_id, numericality: { other_than: 1 , message: "can't be blank"} 

  #delivery_cost_idの設定
  validates :delivery_cost_id, numericality: { other_than: 1 , message: "can't be blank"}

  #prefecture_idの設定
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  #delivery_day_idの設定
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end