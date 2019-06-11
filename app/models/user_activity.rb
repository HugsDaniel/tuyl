class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  def calculate_points!
    skills = self.activity.skills

    skills.each do |skill|
      self.user.user_skills.find_by(skill: skill).pex!
    end
  end
end
