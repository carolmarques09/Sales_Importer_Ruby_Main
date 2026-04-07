class Item < ActiveRecord::Base
  validates :description, presence: true
  validates :price, numericality: true
end