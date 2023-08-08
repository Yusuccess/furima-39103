class Item < ApplicationRecord
  validates :image,                 presence: true
  validates :name,                  presence: true
  validates :details,               presence: true
  validates :category_id,           presence: true
  validates :condition_id,          presence: true
  validates :shipping_fee_id,       presence: true
  validates :shipping_day_id,       presence: true
  validates :prefecture_id,         presence: true

  
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_fee

end
