class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lectures
  validates :role, presence: true, inclusion: { in: ["student", "teacher"] }
  validates :first_name, :last_name, presence: true
  has_one :photo
end
