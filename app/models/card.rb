class Card < ApplicationRecord
  belongs_to :list
  has_many :comments

  validates :name, presence: true

  include RankedModel
  ranks :row_order, with_same: :list_id
end
