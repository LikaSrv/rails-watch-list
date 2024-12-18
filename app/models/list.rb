class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :restrict_with_error
  has_many :movies, through: :bookmarks
  has_one_attached :photo
  validates_presence_of :photo
end
