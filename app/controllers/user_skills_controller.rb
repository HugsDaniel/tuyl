class UserSkillsController < ApplicationController
  def index
    @user_skills = current_user.user_skills.includes(:skill).order('skills.name ASC')
  end

  def update_multiple
    @user_skills = current_user.user_skills
    @user_skills.each do |user_skill|
        user_skill.update_attributes!(user_skills_params[user_skill.id.to_s])
    end

    redirect_to user_path(current_user)
  end

  private

  def user_skills_params
    params.require(:user_skill).permit!
  end
end
