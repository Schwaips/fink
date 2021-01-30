class Lecture < ApplicationRecord
  belongs_to :user
  has_many :schoolings
  validates :title, :description, presence: true
  validates :category, presence: true, inclusion: { in: ["Art", "Developpement", "Gastronomie", "Langue", "Musique", "Photo & video", "Gaming", "Beauté", "Culture générale", "Nature"] }
  has_one_attached :photo
end
