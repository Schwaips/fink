class Block < ApplicationRecord
  belongs_to :lecture
  BLOCK_TYPE = ["Video", "Text", "Podcast", "Live"]
  has_many :photos
  validates :block_type, :content, presence: true
  validates :block_type, inclusion: { in: BLOCK_TYPE }
  has_many_attached :photos
  has_rich_text :content
end
