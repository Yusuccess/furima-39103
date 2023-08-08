class Item < ApplicationRecord

  validates :image,                 presence: true
  validates :name,                  presence: true
  validates :details,               presence: true
  validates :category_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id,       numericality: { other_than: 1 , message: "can't be blank"}

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
