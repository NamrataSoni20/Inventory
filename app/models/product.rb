class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, :price, :quantity, :purchasedate,:category_id, presence: true
end
