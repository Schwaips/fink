class Lecture < ApplicationRecord
  belongs_to :user
  has_many :schoolings
end
