class Comment < ApplicationRecord
  belongs_to :card
  belongs_to :user

  validates :text, presence: true, length: { minimum: 10 }
end
