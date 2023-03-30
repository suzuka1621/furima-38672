class Item < ApplicationRecord
  belongs_to :user
  # has_many :comments #今後の実装で使うが今は保留
  # has_one :order #今後の実装で使うが今は保留
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_state
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  # 共通のバリデーション
  validates :image, :item, :introduction, :price, :category_id, :item_state_id, :delivery_cost_id, :prefecture_id,
            :delivery_day_id, presence: true

  # priceのバリデーション
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' },
                    inclusion: { in: 300..9_999_999, message: 'is out of setting range' }

  # category_idの設定
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  # item_status_idの設定
  validates :item_state_id, numericality: { other_than: 1, message: "can't be blank" }

  # delivery_cost_idの設定
  validates :delivery_cost_id, numericality: { other_than: 1, message: "can't be blank" }

  # prefecture_idの設定
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  # delivery_day_idの設定
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
