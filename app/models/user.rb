class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[slack]

  has_many :schoolings, dependent: :destroy
  has_many :lectures, dependent: :destroy
  validates :role, presence: true, inclusion: { in: ["student", "teacher"] }
  has_one_attached :photo


  def lectures_as_pupil
    Lecture.all.joins(:schoolings).where(schoolings: {user_id: id})
  end

  def students
    lectures.map(&:students).flatten.uniq
  end

  def checking_schoolings

  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
