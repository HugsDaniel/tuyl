class Activity < ApplicationRecord
  validates :name, :description, presence: true

  has_many :activity_skills
  has_many :skills, through: :activity_skills

  has_many :user_activities
  has_many :users, through: :user_activities
end
