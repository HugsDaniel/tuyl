class UsersController < ApplicationController
  def show
    @user = current_user
    @user_skills = @user.user_skills.includes(:skill).order("skills.name ASC")
    @user_activities = @user.user_activities.includes(:activity)
  end
end
