class ExpCalculatorService
  def initialize(user_activity)
    @satisfaction_level = user_activity.satisfaction_level
    @user = user_activity.user
    @activity = user_activity.activity
    @skills = @activity.skills
    @user_skills = @user.user_skills
  end

  def call
    results = []
    @skills.each do |skill|
      results << { skill: skill.name, points: pex(@user_skills.find_by(skill: skill)) }
    end

    return results
  end

  private

  def pex(user_skill)
    result = calculate_points

    user_skill.amount += result
    user_skill.save

    return result
  end

  def calculate_points
    case @satisfaction_level
    when 0
      get_points_from_dice_result(5, 20)
    when 1
      get_points_from_dice_result(4, 40)
    when 2
      get_points_from_dice_result(3, 60)
    when 3
      get_points_from_dice_result(2, 80)
    when 4
      get_points_from_dice_result(1, 100)
    end
  end

  def get_points_from_dice_result(critic, max_value)
    dice_result = launch_dice(max_value)

    dice_result <= 5 ? -rand(1..20) : dice_result
  end

  def launch_dice(max_value)
    rand(1..max_value)
  end
end
