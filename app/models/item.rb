class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image,                 presence: true
  validates :name,                  presence: true
  validates :details,               presence: true
  validates :price,                 presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,          presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_fee


end
