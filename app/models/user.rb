class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :user_activities
  has_many :activities, through: :user_activities

  after_create :create_user_skills

  def create_user_skills
    Skill.all.each do |skill|
      user_skill = self.user_skills.build(skill: skill, amount: 0)
      user_skill.save
    end
  end
end
