class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  def accomplish(params)
    self.assign_attributes(params)
    self.status = "accomplished"

    if self.save
      ExpCalculatorService.new(self).call
    end
  end
end
