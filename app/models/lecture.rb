class Lecture < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates :category, presence: true, inclusion: { in: ["art", "developpement", "gastronomie", "langue", "musique", "photo & video", "gaming", "beauté", "culture générale", "nature"] }
  has_one_attached :photo
end
