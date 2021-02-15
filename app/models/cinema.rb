class Cinema < ApplicationRecord
  validates :title, presence:true, length: {maximum: 30}
  validates :url, presence:true, length: {maximum: 30}
  # belongs_to :user
  # validates_presence_of :user
end
