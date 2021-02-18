class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :schoolings, dependent: :destroy
  has_many :lectures, dependent: :destroy
  validates :role, inclusion: { in: ["student", "teacher"] }
  validates :first_name, :last_name, presence: true
  has_one_attached :photo


  def lectures_as_pupil
    Lecture.all.joins(:schoolings).where(schoolings: {user_id: id})
  end

  def students
    lectures.map(&:students).flatten.uniq.reverse!
  end

  def has_schooling?(lecture)
    Schooling.where(user: self, lecture: lecture).exists?
  end

end
