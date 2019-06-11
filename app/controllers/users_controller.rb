class UsersController < ApplicationController
  def show
    @user = current_user
    @user_skills = @user.user_skills.includes(:skill)
  end
end
