class Review < ApplicationRecord
  belongs_to :bookmark
  validates :content, presence: true
end
