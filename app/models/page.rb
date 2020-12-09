class Page < ApplicationRecord
  belongs_to :book
  has_one_attached :image
  validates :image, presence: true

  def previous
    Page.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Page.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
end
