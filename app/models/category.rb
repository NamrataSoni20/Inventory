class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  validates :category_id, :name,presence: true
end
