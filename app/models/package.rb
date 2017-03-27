class Package < ApplicationRecord
  has_many :users, through: :user_packages
  has_many :user_packages

  validates :name, :description, :price, presence: true
end
