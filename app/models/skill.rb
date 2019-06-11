class Skill < ApplicationRecord
  validates :name, :description, presence: true

  has_many :activity_skills
  has_many :activities, through: :activity_skills

  has_many :user_skills
  has_many :users, through: :user_skills
end
