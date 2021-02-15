class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 20}
  validates :email, length: {maximum: 30}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :cinemas, dependent: :destroy
end
