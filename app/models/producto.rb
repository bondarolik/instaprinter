class Producto < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :slug, presence: true
  validates :description, presence: true
end
