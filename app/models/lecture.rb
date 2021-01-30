class Lecture < ApplicationRecord
  belongs_to :user
  CATEGORY = ["Art", "Developpement", "Gastronomie", "Langue", "Musique", "Photo & video", "Gaming", "Beauté", "Culture générale", "Nature"]
  has_many :schoolings, dependent: :destroy
  validates :title, :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
  has_one_attached :photo
  has_many :blocks, inverse_of: :lecture
  accepts_nested_attributes_for :blocks
end
