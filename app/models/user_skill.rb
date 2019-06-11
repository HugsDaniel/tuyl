class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  def pex!
    self.amount += 5
    # CalculatePointsService.new(satisfaction_level).call
    self.save
  end

  def level
    # CalculateSkillLevel.new(self).call
    if self.amount < 100
      1
    elsif self.amount >= 100 && self.amount < 300
      2
    elsif self.amount >= 300 && self.amount < 600
      3
    end
  end
end
