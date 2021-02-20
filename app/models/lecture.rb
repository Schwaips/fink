class Lecture < ApplicationRecord
  belongs_to :user
  CATEGORY = ["Art", "Developpement", "Gastronomie", "Langue", "Musique", "Photo & video", "Gaming", "Beauté", "Culture générale", "Nature"]
  has_many :schoolings, dependent: :destroy
  has_many :students, through: :schoolings, source: :user
  validates :title, :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
  has_one_attached :photo
  has_many :blocks, inverse_of: :lecture, dependent: :destroy
  accepts_nested_attributes_for :blocks

  attr_accessor :message

  def self.category_empty?(categorie)
    Lecture.where(category: categorie).empty?
  end
end
