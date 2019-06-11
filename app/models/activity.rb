class Activity < ApplicationRecord
  validates :name, :description, presence: true
  has_many :activity_skills
  has_many :skills, through: :activity_skills
end
