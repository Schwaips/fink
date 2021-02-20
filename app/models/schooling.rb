class Schooling < ApplicationRecord
  belongs_to :lecture
  belongs_to :user

  def self.followed_lectures(user)
    Schooling.where(user_id: user)
  end
end
