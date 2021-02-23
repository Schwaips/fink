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
    lectures.map(&:students).flatten.uniq.reverse!
  end

  def has_schooling?(lecture)
    Schooling.where(user: self, lecture: lecture).exists?
  end

  def self.from_omniauth(auth)
    puts
    puts
    puts
    puts auth
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.slack_workspace_uid = user.uid
      user.password = Devise.friendly_token[0, 20]
      name = auth.info.name.split(" ")
      user.first_name = name.first
      user.last_name = name.last
    end
  end
end
