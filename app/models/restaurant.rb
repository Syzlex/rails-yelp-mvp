class Restaurant < ApplicationRecord
  has_many :reviews, :dependent => :delete_all
  validates :name, presence: true
  validates :address, uniqueness: true, presence: true
  validates :category, inclusion: { in: %w[chinese japanese italian french belgian]}
end
