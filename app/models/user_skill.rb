class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  def level
    if self.amount < 100
      1
    elsif self.amount >= 100 && self.amount < 300
      2
    elsif self.amount >= 300 && self.amount < 600
      3
    end
  end
end
