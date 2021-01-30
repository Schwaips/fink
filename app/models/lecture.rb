class Lecture < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates :category, presence: true, inclusion: { in: ["art", "developpement web", "gastronomie", "langue", "musique", "photo & video", "gaming", "beauté", "culture générale"] }
  has_one :photo
end
