class List < ApplicationRecord
  belongs_to :project
  has_many :cards

  validates :name, presence: true

  include RankedModel
  ranks :row_order
end
