class Page < ApplicationRecord
  belongs_to :book
  has_one_attached :image
  validates :image, presence: true
end
