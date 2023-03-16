class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :last_name, :first_name, :last_name_reading, :first_name_reading, :birthday, presence: true

  validates :password, format: { with: /\A[a-z0-9]+\z/, message: "is invalid. Include both letters and numbers" }

  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters" }

  validates :last_name_reading, :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
end