class Cinema < ApplicationRecord
  validates :title, presence:true, length: {maximum: 255}
  validates :url, presence:true, length: {maximum: 255}
end
