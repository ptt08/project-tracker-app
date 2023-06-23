class Project < ApplicationRecord
  belongs_to :workspace
  has_many :lists

  validates :name, presence: true
end
