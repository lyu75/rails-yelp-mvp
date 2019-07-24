class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, exclusion: { in: ['neptunian'] }
end
