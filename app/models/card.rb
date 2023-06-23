class Card < ApplicationRecord
  belongs_to :list
  has_many :comments

  validates :name, presence: true
end
