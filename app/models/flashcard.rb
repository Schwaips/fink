class Flashcard < ApplicationRecord
  belongs_to :block
  validates :question, presence: true
end
